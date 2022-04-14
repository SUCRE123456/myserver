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

<h3>todo list</h3>
<input id="title"><button id="btn">등록</button>
	<div id="list">
		<div data-id="1">test1 true</div>
	</div>

<script>
	const url = "https://jsonplaceholder.typicode.com/todos"
	
	$("#btn").on("click", function(){
		$.ajax({
					url : url,
					method:'POST',
					data: JSON.stringify({title: $("#title").val(), userId : "kim", completed : false}), 
					//data: {title: $("#title").val(), userId : "kim", completed : false}
					//contentType: 쿼리식이면 안써도됨 form데이터로보내줌., json이면 써줌.
					contentType: "application/json"	
					
		}).done(function(response){
			console.log(response)
		})
	})

	//리스트 불러오기.
	$.ajax(url)
	.done(function(data){
		console.log(data)
		console.log(data[0].id)
		console.log(data[0].completed)
		
		for(d of data){
			//completed가 true이며 color = red
			let div = $("<div>")	
				div.html(d.title )
			   .data("id", d.id)
			   .appendTo($("#list"))			
		
			   	if(d.completed){ //true값임.
			   		div.css("color", "red")
			   	}
		}
	})
	
	/* function showId(){
		$("div").on("mouseover", function(){
			console.log( $(this).data("id") );
		})
	}
	showId(); */
</script>

</body>
</html>