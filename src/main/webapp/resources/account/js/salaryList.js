$(function(){
	

	
	$('.table td').click(function(){
		var sNo=$(this).parent().children().eq(0).text();
		location.href='salarydetail.wo?sNo='+sNo;
	})
	
})
function paging(page){
	location.href="acnoticeList.wo?page="+page;
}