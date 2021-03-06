<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>wework</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="images/favicon.png">
<!-- Custom Stylesheet -->
<link
	href="resources/plugins/tables/css/datatable/dataTables.bootstrap4.min.css"
	rel="stylesheet">

<style>
.level-2 {
	padding-left: 30px;
}

.level-3 {
	padding-left: 60px;
}
</style>

</head>

<body>
	<!-- preloader -->
	<div id="preloader">
		<div class="loader">
			<svg class="circular" viewBox="25 25 50 50"> <circle
					class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3"
					stroke-miterlimit="10" /> </svg>
		</div>
	</div>
	<!-- /preloader -->


	<!-- main wrapper -->
	<div id="main-wrapper" style="">
		<c:import url="../common/header.jsp"></c:import>
		<!-- content-body -->
		<div class="content-body" style="min-height: 889px;">

			<div class="row page-titles mx-0">
				<div class="col p-md-0">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="hrNotice.wo">인사</a></li>
						<li class="breadcrumb-item active"><a href="mngEmpChart.wo">인사관리</a></li>
						<li class="breadcrumb-item active"><a href="mngEmpChart.wo">조직관리</a></li>
					</ol>
				</div>
			</div>
			<!-- row -->

			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<h5 class="card-title">조직도 관리</h5>
								<br>
								<button type="button" class="btn mb-1 btn-rounded btn-warning"
									onclick="location.href='addDeptForm.wo';">부서 추가</button>
								&nbsp;
								<!-- <button type="button" class="btn mb-1 btn-rounded btn-warning"
									onclick="location.href='updateDeptForm.wo';">부서 수정</button> -->
								&nbsp;
								<button type="button" class="btn mb-1 btn-rounded btn-warning"
									onclick="location.href='deleteDeptForm.wo';">부서 삭제</button>
								&nbsp;
								<br> <br>
								<div class="table-responsive">
									<table class="table">
										<tbody class="org">
											<c:forEach items="${ list }" var="d">
												<tr class="level-1">
													<th scope="row" style="width: 300px;">${ d.deptName }
														<c:forEach items="${ count }" var="c">
															<c:if test="${ d.deptNum eq c.deptNum }">
															(${ c.count })
															</c:if>
														</c:forEach>
													</th>
													<c:forEach items="${ eList }" var="e" varStatus="status">
														<c:if test="${ e.deptNum eq d.deptNum }">
															<td><span data-toggle="modal"
																data-target="#basicModal${ status.index }" style="cursor: pointer;">
																	${ e.empName }</span>
																<div class="modal fade" id="basicModal${ status.index }"
																	style="display: none;" aria-hidden="true">
																	<div class="modal-dialog" role="document">
																		<div class="modal-content">
																			<div class="modal-header">
																				<h5 class="modal-title">직원정보</h5>
																				<button type="button" class="close"
																					data-dismiss="modal">
																					<span>×</span>
																				</button>
																			</div>
																			<div class="modal-body">
																				<table width="450px" height="300px">
																					<tbody>
																						<tr>
																							<td><h5>&nbsp;&nbsp;&nbsp;&nbsp;${ e.empName }</h5></td>
																							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ e.gradeName }&gt;</td>
																						</tr>
																						<tr>
																							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;부서명</td>
																							<td>${ e.deptName }</td>
																						</tr>
																						<tr>
																							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;입사일</td>
																							<td>${ e.enrollDate }</td>
																						</tr>
																						<tr>
																							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이메일</td>
																							<td>${ e.email }</td>
																						</tr>
																						<tr>
																							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전화번호</td>
																							<td>${ e.empPhone }</td>
																						</tr>
																						
																					</tbody>
																				</table>
																			</div>
																			<div class="modal-footer">
																				<button type="button" class="btn btn-secondary"
																					data-dismiss="modal">Close</button>
																				<button type="button" class="btn btn-primary" onclick="location.href='chatting.wo';">Send
																					Message</button>
																			</div>
																		</div>
																	</div>
																</div></td>
														</c:if>
													</c:forEach>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- #/ container -->
		</div>
		<!-- /content-body -->
		<c:import url="../common/footer.jsp"></c:import>
	</div>
	<!-- /main-wrapper -->
	<script>
		jQuery(document).ready(function() {

			/* Custom jQuery for the example */

			$('#list-html').text($('#org').html());

			$("#org").bind("DOMSubtreeModified", function() {
				$('#list-html').text('');

				$('#list-html').text($('#org').html());

				prettyPrint();
			});
		});
	</script>

</body>
<iframe id="google_esf" name="google_esf"
	src="https://googleads.g.doubleclick.net/pagead/html/r20191003/r20190131/zrt_lookup.html#"
	data-ad-client="ca-pub-2783044520727903" style="display: none;"></iframe>
</html>