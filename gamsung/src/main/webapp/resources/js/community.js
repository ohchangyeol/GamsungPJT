$(function () {
    $("#left-search-btn").on("click", function () {
       	console.log($("button:button[name='search-btn']"));
        $("#currentPage").val(1);
	    $("form").attr("method" , "POST").attr("action","/community/listPost").submit();	    
        
    });
});