<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/myserver/resources/serializeObject.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
</head>
<body >
<button id="btn">영화조회</button>
<table border="1" >
	<thead>
		<tr>
			<td>영화순위</td>
			<td>영화코드</td>
			<td>영화명</td>
			<td>개봉일</td>
		</tr>
	</thead>
	<tbody id="tab" >
	
	</tbody>
	
	
</table>
<table border="1" >
	<thead>
	<tr>
		<td>영화코드</td>
		<td>영화명</td>
		<td>영화유형명</td>
		<td>감독명</td>
		<td>개봉연도</td>
		<td>상영시간</td>
		<td>관람등급</td>
	</tr>
	</thead>
	<tbody id="tab2">
	
	</tbody>
</table>

<div id="div"></div>

<script>
//get방식으로 json 받아오기.

$("#btn").on("click", function(){
	const url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=20220503"
		$.ajax(url)
			.done(function(datas){
				var list = datas.boxOfficeResult.dailyBoxOfficeList;
				$("#tab").empty();
				
				for(mv of list){
					$("<tr>").attr("data-cd",mv.movieCd )
							 .append($("<td>").html(mv.rank))
							 .append($("<td>").html(mv.movieCd))
							 .append($("<td>").html(mv.movieNm))
							 .append($("<td>").html(mv.openDt))
							 .append($("<button>").html("상세조회").addClass("btnView"))
							 .appendTo("#tab")

				}
			})
})

			//그룹이벤트 또는 이벤트 위임.비동기식이므로 먼저 실행, 이벤트안걸려서.
			$("#tab").on("click", ".btnView", function(){
				
				//이벤트가 발생한 태그(이벤트 타겟)
				var cd = $(this).closest("tr").find("td").eq(1).html();
				
				const url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=f5eef3421c602c6cb7ea224104795888&movieCd=" + cd;
				
				$("div").empty();
				
				var frm = $("<form>");
				frm.attr("name", "form2").attr("id", "form2").appendTo("#div");
				 
				$("#tab2").empty();
				
				 $.ajax(url)
				.done(function(datas){
					console.log(datas);
					var mv = datas.movieInfoResult.movieInfo;
					
						$("<tr>").append($("<td>").html(mv.movieCd))
								 .append($("<td>").html(mv.movieNm))
								 .append($("<td>").html(mv.typeNm))
								 .append($("<td>").html(mv.directors[0].peopleNm))
								 .append($("<td>").html(mv.openDt))
								 .append($("<td>").html(mv.showTm))
								 .append($("<td>").html(mv.audits[0].watchGradeNm))
								 .append($("<button>").html("DB저장")).addClass("btnSave")
								 .appendTo("#tab2");
								 
						
								 
								 $("<input>").val(mv.movieCd).attr("type", "text").attr("name", "movieCd").appendTo(frm);
								 $("<input>").val(mv.movieNm).attr("type", "text").attr("name", "movieNm").appendTo(frm);
								 $("<input>").val(mv.typeNm).attr("type", "text").attr("name", "typeNm").appendTo(frm);
								 $("<input>").val(mv.directors[0].peopleNm).attr("type", "text").attr("name", "peopleNm").appendTo(frm);
								 $("<input>").val(mv.openDt).attr("type", "text").attr("name", "openDt").appendTo(frm);
								 $("<input>").val(mv.showTm).attr("type", "text").attr("name", "showTm").appendTo(frm);
								 $("<input>").val(mv.genres[0].genreNm).attr("type", "text").attr("name", "genreNm").appendTo(frm);
								 //$("<input>").val(mv.audits[0].watchGradeNm).attr("type", "text").attr("id", "watchGradeNm").appendTo("#form2");
					
				}) 
				
				
			})
			
				
			//그룹이벤트 또는 이벤트 위임.비동기식이므로 먼저 실행, 이벤트안걸려서.
			$("#tab2").on("click", ".btnSave", function(){
				//이벤트가 발생한 태그(이벤트 타겟)
				var cd = $(this).closest("tr").find("td").eq(1).html();
				const url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=f5eef3421c602c6cb7ea224104795888&movieCd=" + cd;
				
				/* var cd = $(this).closest("tr").find("td").eq(0).html();
				var mvNm = $(this).closest("tr").find("td").eq(1).html();
				var tyNm = $(this).closest("tr").find("td").eq(2).html();
				var peoNm = $(this).closest("tr").find("td").eq(3).html();
				var opDt = $(this).closest("tr").find("td").eq(4).html();
				var shTm = $(this).closest("tr").find("td").eq(5).html(); */
				
				//var genNm = 
				console.log(JSON.stringify($("#form2").serializeObject()));
					//JSON.stringify($("#form1").serializeObject()),
				   $.ajax({
					 url : "movies",
					 method : "POST",
					 data : JSON.stringify($("#form2").serializeObject()),
						/*  movieCd : cd,
						 movieNm : mvNm,
						 typeNm : tyNm,
						 peopleNm : peoNm,
						 openDt : opDt,
						 showTm : shTm,
						 genreNm : genNm */
					 
					 contentType : "application/json",	
					 success : function(response){
						 alert("등록완료!")
						
						 },
						 
					 error:function(request,status,error){
					        //alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
					        alert("이미 등록된 영화");// 실패 시 처리
					        $("#div").empty();
					       }


				 })
				
				
									
			})
			
			


	
	
</script>

</body>
</html>