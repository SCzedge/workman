<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Calendar</title>
<link rel="icon" type="image/png" sizes="16x16"
	href="resources/icons/logo1.png">

 <meta charset='utf-8'>
 <meta http-equiv='X-UA-Compatible' content='IE=edge'>
 <meta name='viewport' content='width=device-width, initial-scale=1'>
 <link rel='stylesheet' type='text/css' media='screen' href='main.css'>
 <script src='main.js'></script>
 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<style>
        .outdiv{
            width:70%;
            margin: auto;
            padding-left: 20px;
            padding-top:50px;
        }
        h2{
            text-align: center;
        }
        .inlinediv{
            display: inline-block;
        }
        #detailId{
            height: 300px;
        }
        .butdiv{
            text-align:center;
        }
        .btn{
            width:100px;
        }
    </style>
</head>
<body>

<div id="main-wrapper" style="background: white;">
<c:import url="../common/header.jsp"></c:import>
		
	 	<div class="content-body">
			<div class="content-fluid" style="height: 100px;" align="center">
				<div class="insertouter">
				
				
    <div class="outdiv">
        <h2>�� ��&nbsp; �� ��</h2>
        <br>
        
        <div class="inlinediv" style="width: 70%;">
          <div class="input-group mb-3">
             <div class="input-group-prepend">
               <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Type</button>
               <div class="dropdown-menu">
                 <a class="dropdown-item" href="#">��ü����</a>
                 <a class="dropdown-item" href="#">�ѹ�/ȸ��</a>
                 <a class="dropdown-item" href="#">�λ�</a>
               </div>
             </div>
             <input type="text" class="form-control" aria-label="Text input with dropdown button" placeholder="������ �Է��ϼ���.">
           </div>
        </div>

        <div class="inlinediv" style="width: 25%;">
           <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="inputGroup-sizing-default">�ۼ���</span>
                </div>
            <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
         </div>
        </div>  

        <div class="inlinediv" style="width: 40.5%;">
          <div class="input-group mb-3">
            <div class="input-group-prepend">
              <span class="input-group-text" id="inputGroup-sizing-default">����</span>
            </div>
            <input type="datetime-local" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
          </div>
        </div>
           
        <div class="inlinediv" style="width: 40.5%;">
          <div class="input-group mb-3">
            <div class="input-group-prepend">
              <span class="input-group-text" id="inputGroup-sizing-default">����</span>
            </div>
            <input type="datetime-local" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
          </div>
        </div>

        <div class="inlinediv">
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <div class="input-group-text">
                    <input type="checkbox" aria-label="Checkbox for following text input">
                    </div>
                </div>
                <p class="form-control" aria-label="Text input with checkbox">&nbsp;ALL DAY&nbsp;</p>
            </div>
         </div>

        <!--  <div class="inlinediv" style="width: 48%;">
         <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text" id="inputGroup-sizing-default">����</span>
            </div>
            <input type="color" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
        </div>
        </div>

        <div class="inlinediv" style="width: 48%;">
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text" id="inputGroup-sizing-default">���ڻ�</span>
            </div>
            <input type="color" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
        </div>
       </div> -->

         <div class="input-group mb-3" style="width: 96%;">
            <div class="input-group-prepend">
                <span class="input-group-text" id="inputGroup-sizing-default">�󼼳���</span>
            </div>
            <input type="text" id="detailId" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
        </div>

        <div class="butdiv">
            <button type="reset" class="btn btn-outline-danger">���</button>
            <button type="submit" class="btn btn-secondary">���</button>
        </div>
        <br>

    </div>
    
    
				</div>
			</div> 
		</div>
  
		<c:import url="../common/footer.jsp"></c:import>	
	</div>

</body>
</html>