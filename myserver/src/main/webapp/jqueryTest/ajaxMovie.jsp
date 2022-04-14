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

<script>
//get방식으로 json 받아오기.
const url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=20220412"
$.ajax(url)
	.done(function(data){
		console.log(typeof data);
		console.log(data);
		console.log( data.boxOfficeResult.dailyBoxOfficeList[0].movieNm );
		console.log( data.boxOfficeResult.dailyBoxOfficeList[0].movieCd );
	})
	
	const url2 = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=f5eef3421c602c6cb7ea224104795888&movieCd=20204431"
	$.ajax(url2)
		.done(function(data){
			console.log(data)
			const director = data.movieInfoResult.movieInfo.directors[0].peopleNm
			console.log("감독 : " + director);
		})
</script>

</body>
</html>