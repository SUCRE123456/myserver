<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <link rel="icon" href="./images/favicon.png" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>user_jquery.jsp</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="template/js/json.min.js"></script>
	<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

</head>
<body>
	<div class="container">
		<form id="form1" name="form1" class="form-horizontal">
			<h2>사용자 등록 및 수정</h2>
			<div class="form-group">
				<label>아이디:</label> <input type="text" class="form-control"
					name="id">
			</div>
			<div class="form-group">
				<label>이름:</label> <input type="text" class="form-control"
					name="name">
			</div>
			<div class="form-group">
				<label>패스워드:</label> <input type="text" class="form-control"
					name="password">
			</div>
			<div class="form-group">
				<label>역할:</label> <select class="form-control" name="role">
					<option value="Admin">관리자</option>
					<option value="User">사용자</option>
				</select>
			</div>
			<div class="btn-group">
				<input type="button" class="btn btn-primary" value="등록" id="btnInsert" /> 
				<input type="button" class="btn btn-primary" value="수정" id="btnUpdate" /> 
				<input type="button" class="btn btn-primary" value="초기화" id="btnInit" />
			</div>
		</form>
	</div>
	<hr />
	<div class="container">
		<h2>사용자 목록</h2>
		<table class="table text-center">
			<thead>
				<tr>
					<th class="text-center">아이디</th>
					<th class="text-center">패스워드</th>
					<th class="text-center">이름</th>
					<th class="text-center">롤</th>
					<th class="text-center"></th>
				</tr>
			</thead>
			
			<tbody>
				<!-- <tr>
					<td class="text-center">user</td>
					<td class="text-center">1111</td>
					<td class="text-center">홍길동</td>
					<td class="text-center">User</td>
					<td class="text-center">
						<button class="btnUpd">조회</button>
						<button class="btnDel">삭제</button>
					</td>
				</tr> -->

			</tbody>
		</table>
	</div>
<script>    
	const url = "http://localhost/myserver/users"
	
	
	
	
	//등록버튼 : 직접이벤트 
	function userInsert(){
		$("#btnInsert").on("click", function(){
		console.log($("#form1").serializeObject());
			$.ajax({
					url : "users", 
					method : 'POST',
					data : JSON.stringify($("#form1").serializeObject()),
					contentType : "application/json"	
				   })
			.done(function(response){
					$("tbody").prepend( makeTr(response) );	
								})

		})
	}
	//수정버튼 : 직접이벤트
	function userUpdate(){
		//버튼 클릭이벤트 - > ajax호출.
		/* $("#btnUpdate").on("click", function(){
	
			//등록과 동일 : post - > put/  prepend => replace
		const ajax = new XMLHttpRequest();
		const url = "http://localhost/myserver/users";
		ajax.onload = function () {
			let user = JSON.parse(ajax.response);

				let newTr = makeTr(user)
				let oldTr = document.querySelector('[data-id'+user.id+']')
				console.log(oldTr)
				document.getElementsByTagName("tbody")[0].replaceChild(newTr, oldTr);  //????????
		}
		ajax.open("PUT", url);
		ajax.setRequestHeader("Content-type", "application/json");
		
			let id = form1.id.value 
			let name = form1.name.value
			let password = form1.password.value
			let role = form1.role.value
				let obj = {id, name, password, role}
		ajax.send(JSON.stringify(obj) );
			
		}) */
	}
	//조회버튼 : 그룹이벤트 
	function userSelect(){
		$("table").on("click", ".btnUpd", function(){
			const userId = $(this).closest("tr").children().first().html()
			const url = "users/"+userId;
			console.log(url);
			$.ajax(url)
			 .done(function(res){
				 	form1.id.value = res.id;
					form1.password.value = res.password;
					form1.name.value = res.name;
					form1.role.value = res.role;
			 })
		})
		}
		
		
	//삭제버튼 : 그룹이벤트 
	function userDelete(){
		$("table").on("click", ".btnDel", function(){
			var tr = $(this).closest("tr")
			
			const userId = $(this).closest("tr").children().first().html()
			const url = "users/"+userId;
			console.log(url);
			$.ajax({
				url : url,
				method : "delete",
				})
			 .done(function(res){
				 tr.remove();
			 })
		})
	}
	
	function list() {
		$.ajax(url)
		.done(function(datas){
				
				console.log( typeof datas)
				for(d of datas) {	
					$("tbody").append( makeTr(d) );
					//[0]붙이면 dom 객체...에서만작동.
				}
			})
		}
	

	function makeTr(d){
		let tr = $("<tr>");
		tr.attr("data-id",`${d.id}`)
			tr.html(`<td class="text-center">\${d.id}</td>
				<td class="text-center">\${d.password}</td>
				<td class="text-center">\${d.name}</td>
				<td class="text-center">\${d.role}</td>
				<td class="text-center">
					<button class="btnUpd">조회</button>
					<button class="btnDel">삭제</button>
				</td>
			</tr>`)
			return tr;
	}
	//페이지 로드이벤트
	$(function(){
		
		userInsert();
		userUpdate();
		userSelect();
		userDelete();
		list();
	})
	
</script>
</body>
</html>