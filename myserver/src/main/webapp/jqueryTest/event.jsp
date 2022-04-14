<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
	.active{background-color : green; color: white}
</style>
</head>
<body>
	<input id="book">
	<ul>
		<li data-isbn="101"><span>스프링</span>
		<li data-isbn="102"><span>자바</span>
		<li data-isbn="103"><span>파이썬</span>
	</ul>
	<script>
	
		
		$("#book").focus();
		//추가한 데이터 속성은 화면에 안보임.
		$("#book").on("keypress", function(){
			if(event.keyCode==13){
				/* var val = $(this).val();
				var $li = $("<li>");
				$li.html(val);
				$("ul").append($li);
				$(this).val(""); */
				
				$("<li>").append( $("<span>").html( $("#book").val() ) )
						 .data("isbn", num)
						 .appendTo( $("ul") )
						 
				$(this).val("")
			}
		})
		//그룹이벤트 걸어줌.★★★★★★★★★★★★★★★★★★★★
		$("ul").on("click", "li", function(){
			$(this).remove();
			$("#book").focus();
		})
		
		/* $("li").on("mouseover", function(){
			//$(event.target).css('background-color', 'blue');
			$(event.target).addClass("active");
		})
		$("li").on("mouseout", function(){
			//$(event.target).css('background-color', 'white');
			$(this).removeClass("active");
		}) */
		//그룹이벤트(부모에 위임) ul의 li가 타겟임.★★★★★★★★★★★★★★★★
		$("ul").on("mouseover mouseout", "span", function(){
			$(this).toggleClass("active");
			
			//span 태그부모 li태그의 isbn 데이터 속성 출력
			console.log( $(this).parent().data("isbn") );
		})
		
		
		
		
		
		
	</script>
</body>
</html>