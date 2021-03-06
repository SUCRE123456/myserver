<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>jQuery UI Tabs - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">

  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script> 
  
  <script>
  $( function() {
	  //아코디언
	  $("#accordion").accordion();
	  
	  //탭
    $( "#tabs" ).tabs({
    			  active: 2, //새로고침하면 2번째 페이지로
    			  activate: function( event, ui ) {
    				  console.log(ui.newTab.text()) //클릭된 li 태그의 값 .jquery 객체이므로 text()함수사용.
    			  }
    			  });
	  
	  //데이트피커
	  $(".dt").datepicker({ //id로 걸면 하나밖에 적용안됨.
		  dateFormat :"yy-mm-dd",
		  
	  });
	  //팝업
	 	let dialog =  $("#empReg").dialog({
		  autoOpen: false,
		  modal : true
	  });
	  //모달오픈버튼 클릭 이벤트
	  $("#btn").on("click", function(){
		  dialog.dialog("open")
	  })
	  
	  
  } );
  </script>
</head>
<body>
 
<div id="tabs">
  <ul>
    <li><a href="#tabs-1">Nunc tincidunt</a></li>
    <li><a href="chart.jsp">차트</a></li>
    <li><a href="trAppend.jsp">Aenean lacinia</a></li>
  </ul>
  
  <div id="tabs-1">
    <p>Proin elit arcu, rutrum commodo, vehicula tempus, commodo a, risus. Curabitur nec arcu. Donec sollicitudin mi sit amet mauris. Nam elementum quam ullamcorper ante. Etiam aliquet massa et lorem. Mauris dapibus lacus auctor risus. Aenean tempor ullamcorper leo. Vivamus sed magna quis ligula eleifend adipiscing. Duis orci. Aliquam sodales tortor vitae ipsum. Aliquam nulla. Duis aliquam molestie erat. Ut et mauris vel pede varius sollicitudin. Sed ut dolor nec orci tincidunt interdum. Phasellus ipsum. Nunc tristique tempus lectus.</p>
  </div>
  
  <div id="accordion">
  <h3>Section 1</h3>
  
  <div>
  <input id="birth" name="birth" class="dt">
  <button id="btn">사원등록팝업열기</button>
   	<div id="empReg" title="사원등록">
	  <h3>사원등록</h3>
	  <input id="birth" name="birth" class="dt">
	</div>
  </div>
 
  <h3>Section 2</h3>
  <div>
    <p>Sed non urna. Phasellus eu ligula. Vestibulum sit amet purus.
    Vivamus hendrerit, dolor aliquet laoreet, mauris turpis velit,
    faucibus interdum tellus libero ac justo.</p>
  </div>
  <h3>Section 3</h3>
  <div>
    <p>Nam enim risus, molestie et, porta ac, aliquam ac, risus.
    Quisque lobortis.Phasellus pellentesque purus in massa.</p>
    <ul>
      <li>List item one</li>
      <li>List item two</li>
      <li>List item three</li>
    </ul>
  </div>
</div>
  
</div>
 
 
</body>
</html>