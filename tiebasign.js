function sign()
{
    var url="/sign/add"
    var kw = PageData.forum.name;
    var tbs = PageData.tbs;
    $.post(url,{ie:"utf-8",kw:kw,tbs:tbs},function(resultJSONObject){
           console.log(resultJSONObject);
           __gChrome.e_push({
                            command: "tieba.sign",
                            result:resultJSONObject
                            })
           },"json");
}
