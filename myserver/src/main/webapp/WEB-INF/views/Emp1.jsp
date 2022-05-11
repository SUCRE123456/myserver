<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="frm" method="post" action="findById">
<input name="employee_id" id="empId"><button type="button" id="btn">조회</button>
</form>
<div id="result"></div>
<button type="button" id="btnAjax">ajax조회</button>

<script>
	btn.addEventListener("click", function(){
	//get(post, action 필요없음. input에 name 필요없음.)
	//location.href="findById?employee_id="+empId.value;
	
	
	//post//post, action 필요. input에 name 필요.
	//document.forms[0].
	frm.submit();
	})

	//btnAjax
	btnAjax.addEventListener("click", function(){
	
			/* fetch("ajax/findById?employee_id="+empId.value)
			.then(res => res.json()) // json을 js객체로.
			.then(res => result.innerHTML = res[0].first_name) */
			
			
			fetch("ajax/findById2",{
				method :"POST",
				header : {"Content-Type" : "application/json"},
				body : JSON.stringify({
					employee_id : empId.value
				}), 
				
			})
			.then(res => res.json()) // json을 js객체로.
			.then(res => result.innerHTML = res[0].first_name)

	});
	
	
	
</script>
</body>
</html>