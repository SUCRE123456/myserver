<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>

	<label>아이디 : </label><input id="userid" ><br>
	<label>이름 : </label><input id="username" ><br>
	<label>급여 : </label><input id="sal" ><br>
	<button type="button" id="btn">등록</button>

<table>
	
	<thead>
		<tr><td>이름</td><td>급여</td></tr>
	</thead>
	<tbody>
		<tr data-userid="101"><td>홍길동</td><td>1000</td></tr>
	</tbody>
</table>

<script>
	//버튼 클릭 이벤트
	//입력값 어펜드.
	$("#btn").on("click", function(){
		var userid = $("#userid").val();
		var username = $("#username").val();
		var sal = $("#sal").val();
		
		var tr = $(`<tr data-userid="\${userid}"><td>\${username}</td><td>\${sal}</td></tr>`)

			$("tbody").append(tr);
	})
	//1.등록 
	/* $("#btn").on("click", function(){
		var userid = $("#userid").val();
		var username = $("#username").val();
		var sal = $("#sal").val();

		var tr = $("<tr>").append( $("<td>").html(username) )
		 		 		  .append( $("<td>").html(sal) )
		 				  .data("userid", userid)		
		 				  .appendTo($("tbody"))
	}) */
	
	
	//userid 콘솔에 찍기.(그룹이벤트적용)
	$("tbody").on("mouseover", "tr", function(){
		console.log($(this).data("userid")) 			
	})
	
</script>
</body>
</html>