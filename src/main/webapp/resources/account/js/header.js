$(function(){
	$.ajax({
		url:"checkAttendance.wo",
		dataType:"json",
		type:"post",
		success:function(data){
			console.log(data.result);
			if(data.result>0){
				$('#hi').css('display','none');
				$('#bye').removeProperty('display');
			}else{
				$('#bye').css('display','none');
				$('#hi').removeProperty('display');
			}
		},
		error:function(){
			console.log(11);
			
		}
	});
})