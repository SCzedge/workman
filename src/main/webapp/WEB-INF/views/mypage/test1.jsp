<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<style type="text/css">
	table tr{
		height: 50px;
		color: black;
		font-size: 20px;
	}
	
	.postcodify_postcode5:hover, .postcodify_address:hover{
		cursor: pointer;
	}
	
	
	

</style>
<title>개인정보</title>
</head>
<body>
	
	
	<!--*******************
        Preloader start
    ********************-->
	<div id="preloader">
		<div class="loader">
			<svg class="circular" viewBox="25 25 50 50"> <circle
					class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3"
					stroke-miterlimit="10" /> </svg>
		</div>
	</div>
	<!--*******************
        Preloader end
    ********************-->


	<!--**********************************
        Main wrapper start
    ***********************************-->
	<div id="main-wrapper" style="background: white;">
		<c:import url="../common/header.jsp"></c:import>
		<!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body">
			<div class="content-fluid" style="height: 100px;" align="center">
				<h1>내 정보 관리</h1>
				<br><br>
				<form action="empUpdate.wo">
					<table width="800" celspacing="5">
						<tr>
							<td width="200">사번</td>
							<td><input type="text" name="num" value="${ loginMan.num }" readonly></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input name="name" value="${ loginMan.name }" readonly></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="email" name="email" value="${ loginMan.email }" readonly></td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td><input name="birth" value="${ loginMan.birth }" readonly></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input type="text" name="phone" value="${ loginMan.phone }"></td>
						</tr>
						<tr>
							<td>직급</td>
							<td><input value="${ loginMan.gradeName }" readonly></td>
						</tr>
						<tr>
							<td>부서</td>
							<td><input value="${ loginMan.deptName }" readonly></td>
						</tr>
						<tr>
							<td>입사일</td>
							<td><input value="${ loginMan.enrollDate }" readonly></td>
						</tr>
						
						<c:if test="${ empty loginMan.address }">
							<tr>
								<td>주소</td>
								<td>
									<input type="text" name="address1" size="40" class="postcodify_address" readonly="readonly">
								</td>
							</tr>
							<tr>
								<td>상세주소</td>
								<td>
									<input type="text" name="address2" size="40" class="postcodify_extra_info">
								</td>
							</tr>
						</c:if>
						<c:if test="${ !empty loginMan.address }">
							<c:forTokens items="${ loginMan.address }" delims="," var="addr" varStatus="status">
								<c:if test="${ status.index eq 0 }">
									<tr>
										<td>주소</td>
										<td>
											<input type="text" name="address1" size="40" value="${ addr }" class="postcodify_address">
										</td>
									</tr>
								</c:if>
								<c:if test="${ status.index eq 1 }">
									<tr>
										<td>상세 주소</td>
										<td>
											<input type="text" name="address2" size="40" value="${ addr }"  class="postcodify_extra_info">
										</td>
									</tr>
								</c:if>
							</c:forTokens>
							
						
						</c:if>
						
						
					</table>
					<br><br>
					<button type="submit" class="btn btn-secondary btn-lg">수정</button>
					
				</form>
				<br><br><br><br>
			</div>
				
			
			<!-- row -->
	
			<!-- #/ container -->
		</div>
		<!--**********************************
            Content body end
        ***********************************-->
		<c:import url="../common/footer.jsp"></c:import>	
	</div>
	<!--**********************************
        Main wrapper end
    ***********************************-->
    
    
    <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script>
		$(function(){
			$(".postcodify_address").postcodifyPopUp();
		});
	</script>
    
    
    
    
    
</body>
</html>