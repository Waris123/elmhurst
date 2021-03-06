class AnnotationsController < ApplicationController

  before_action :load_project, only: [:create]
	
  def create
    @annotation = Annotation.new(annotation_params.merge!({Project_Select: @project.title}))
    if params["date_status"] == "order"
      # opted order
      # if order date is same as current date, request should appear on chart
      @annotation.date_status = params["date_status"]
      @annotation.date = params["date"]
    else
      # opted delivery, request should immediately showup in chart..

      @annotation.date_status = params["date_status"]
      @annotation.date = params["date"]
    end
    @annotation.item_price_dup = params[:Item_Price]
      @annotation.annotation_creator_id = current_user.id
    if @annotation.save!
      flash[:success] = "Request Submit Successfully"
      redirect_to researchertDetail_path(id: @project.id)
    else
      flash[:error] = "Request Submit Unsuccessful"
      redirect_to Register_path
    end
	end

  def show
    @annotation = Annotation.where(annotation_creator_id: current_user.id).paginate(:page => params[:page], :per_page => 5).order('created_at DESC')  rescue nil
    @member = Project.find_by(title: Annotation.find_by_id(params[:id]).Project_Select).members rescue nil
  end 

  private

  def load_project
    @project = Project.find_by(id: params[:Project_Select])
    if @project.blank?
      flash[:error] = "Invalid Affiliate Id"
      redirect_to Register_path
    end
  end
  
  def annotation_params
      params.permit(:Item_Name, :Item_Price, :Merchant_Name, :Source, :Note)
  end
end
