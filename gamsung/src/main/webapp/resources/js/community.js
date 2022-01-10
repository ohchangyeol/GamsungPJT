$(function () {
    $("button:button[name='search-btn']").on("click", function () {
       	console.log($("button:button[name='search-btn']"));
	$("form").attr("method" , "POST").attr("action","/community/listPost").submit();	    
        
    });
});