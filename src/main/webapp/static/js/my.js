
//$("a").attr("title",$(this).html());
$(function () {
    //alert($('a').length);
    $('a').each(function () {
        var html = $(this).text();
        //alert(html);
        $(this).attr("title",html);
    })
})
