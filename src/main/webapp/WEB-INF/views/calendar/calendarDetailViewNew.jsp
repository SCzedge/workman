<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 캘린더 보기 -->
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<title>Calendar</title>

<link rel="icon" type="image/png" sizes="16x16" href="resources/icons/logo1.png">

<!-- <link href='resources/css/demo-to-codepen.css' rel='stylesheet' /> -->

<style>
    html, body {
      margin: 0;
      padding: 0;
      font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
      font-size: 14px;
    }

    #calendar {
	    max-width: 900px;
	    margin-left: 27%;
	}
	
</style>
  
 <link href='https://unpkg.com/@fullcalendar/core@4.3.1/main.min.css' rel='stylesheet' />
<link href='https://unpkg.com/@fullcalendar/daygrid@4.3.0/main.min.css' rel='stylesheet' />
<!-- <script src='resources/js/demo-to-codepen.js'></script> -->
<script src='https://unpkg.com/@fullcalendar/core@4.3.1/main.min.js'></script>
<script src='https://unpkg.com/@fullcalendar/daygrid@4.3.0/main.min.js'></script>

<style>
  .popper,
  .tooltip {
    position: absolute;
    z-index: 9999;
    background: #FFC107;
    color: black;
    width: 150px;
    border-radius: 3px;
    box-shadow: 0 0 2px rgba(0,0,0,0.5);
    padding: 10px;
    text-align: center;
  }
  .style5 .tooltip {
    background: #1E252B;
    color: #FFFFFF;
    max-width: 200px;
    width: auto;
    font-size: .8rem;
    padding: .5em 1em;
  }
  .popper .popper__arrow,
  .tooltip .tooltip-arrow {
    width: 0;
    height: 0;
    border-style: solid;
    position: absolute;
    margin: 5px;
  }

  .tooltip .tooltip-arrow,
  .popper .popper__arrow {
    border-color: #FFC107;
  }
  .style5 .tooltip .tooltip-arrow {
    border-color: #1E252B;
  }
  .popper[x-placement^="top"],
  .tooltip[x-placement^="top"] {
    margin-bottom: 5px;
  }
  .popper[x-placement^="top"] .popper__arrow,
  .tooltip[x-placement^="top"] .tooltip-arrow {
    border-width: 5px 5px 0 5px;
    border-left-color: transparent;
    border-right-color: transparent;
    border-bottom-color: transparent;
    bottom: -5px;
    left: calc(50% - 5px);
    margin-top: 0;
    margin-bottom: 0;
  }
  .popper[x-placement^="bottom"],
  .tooltip[x-placement^="bottom"] {
    margin-top: 5px;
  }
  .tooltip[x-placement^="bottom"] .tooltip-arrow,
  .popper[x-placement^="bottom"] .popper__arrow {
    border-width: 0 5px 5px 5px;
    border-left-color: transparent;
    border-right-color: transparent;
    border-top-color: transparent;
    top: -5px;
    left: calc(50% - 5px);
    margin-top: 0;
    margin-bottom: 0;
  }
  .tooltip[x-placement^="right"],
  .popper[x-placement^="right"] {
    margin-left: 5px;
  }
  .popper[x-placement^="right"] .popper__arrow,
  .tooltip[x-placement^="right"] .tooltip-arrow {
    border-width: 5px 5px 5px 0;
    border-left-color: transparent;
    border-top-color: transparent;
    border-bottom-color: transparent;
    left: -5px;
    top: calc(50% - 5px);
    margin-left: 0;
    margin-right: 0;
  }
  .popper[x-placement^="left"],
  .tooltip[x-placement^="left"] {
    margin-right: 5px;
  }
  .popper[x-placement^="left"] .popper__arrow,
  .tooltip[x-placement^="left"] .tooltip-arrow {
    border-width: 5px 0 5px 5px;
    border-top-color: transparent;
    border-right-color: transparent;
    border-bottom-color: transparent;
    right: -5px;
    top: calc(50% - 5px);
    margin-left: 0;
    margin-right: 0;
  }

</style>


<script src='https://unpkg.com/popper.js/dist/umd/popper.min.js'></script>
<script src='https://unpkg.com/tooltip.js/dist/umd/tooltip.min.js'></script>

<script>
	document.addEventListener('DOMContentLoaded', function() {

    var calendarEl = document.getElementById('calendar');
    
    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
      //selectable: true,
      header: {
        left: 'today',
        center: 'title',
        right: 'prev,next'
      },
      
      events: function (start, end, callback) {
    	  
    	 $.ajax({
           url: 'calDetailView2.wo',
           type: "GET",
           async:false,
           datatype: 'json',
           success:  function(calendarList) {
        	   console.log(calendarList);
               var events = [];
            	
               $.map( calendarList.result, function( obj ) {
               for (var i=0; i<=5; i++) //리스트 생성
            	      {
            	   		events.push({
            	        title : obj.description
            	        });
            	      }
            	      });
               
               callback(events);
              },
             });
         },
          eventRender: function (event, element) {
        	  var icon  = '<div class="fc-event" value="전체" style="width:15px; height:15px; background:blue;"></div>'
              $(element).find('.fc-content').append(icon);
         },
        /*  dayClick: function(date, jsEvent, view) {
          return false;
         },
         eventClick: function(calEvent, jsEvent, view) {
          return false;
      },   */
    	 
      dateClick: function(info) {
        location.href= 'calInsertView.wo';
      } ,
      select: function(info) {
        location.href= 'calInsertView.wo';
      }
    });
    calendar.render();
  });
</script>


</head>

<body>

	<div id="main-wrapper" style="background: white;">
	 <c:import url="../common/header.jsp"></c:import>
	
<form action="calDetailView.wo" method="post" class="outdiv">
<!--   <div id='external-events'>
    <div class='fc-event' id="all">전체</div>
    <div class='fc-event' id="dep">부서</div>
    <div class='fc-event' id="pri">개인</div>
   </div> -->
 
  <div id='calendar'></div>
</form>
		<c:import url="../common/footer.jsp"></c:import>	
	</div>

<style>
$(function(){

$('.fc-title').css('color', 'white');

})

</style>
</body>



</html>