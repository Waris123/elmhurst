//get cookies function
function getCook(cookiename)
{
    var cookiestring = RegExp("" + cookiename + "[^;]+").exec(document.cookie);
    return unescape(!!cookiestring ? cookiestring.toString().replace(/^[^=]+./, "") : "");
}

var user_id = getCook('user_id');

var first_name = getCook('first_name');

var last_name = getCook('last_name');

var project_id = getCook('project_id');

//main api url
//var mainUrl = '//elmhur.st/api/v1/';
//alert(user_id);
var mainUrl = 'https://www.elmhur.st/api/v1/';

//var requset ='https://localhost:8080/elmuhrst/rest/projectResearcher/2/1'

//requset api url 
var requsetURL = 'https://elmhur.st/elmuhrst/rest/request';
//var requsetURL = 'http://elmhur.st/elmuhrst/rest/request';

//projectResearcher api url 
var projectResearcherUrl = 'https://elmhur.st/elmuhrst/rest/projectResearcher/';
//var projectResearcherUrl = 'http://elmhur.st/elmuhrst/rest/projectResearcher/';