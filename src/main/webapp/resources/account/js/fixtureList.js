$(function(){
	

	
	$('.table td').dblclick(function(){
		console.log(11);
		
	})
	
})
function paging(page){
	location.href="acnoticeList.wo?page="+page;
}