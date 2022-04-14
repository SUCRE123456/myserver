<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart(){
    	  drawChart1();
    	  drawChart2();
      }
      
      function drawChart2(){
    	  var options = {'title':'부서별 급여평균',
                  'width':400,
                  'height':300};
    	// Create the data table.
          var data = new google.visualization.DataTable();
          data.addColumn('string', '부서');
          data.addColumn('number', '평균급여');
          
          //ajax로 호출
          let jsonData; //변수선언 여기.
          
  	        $.ajax({
  	        	url : "findStat2", //.은 상대경로..
  	        	//async : false //비동기. 차례대로 실행. 안하면 .done 나중에 실행됨.
  	        })
  	        .done(function(datas){
  	        	jsonData = []; //배열로 초기화.
  	        	for(let data of datas){
  	        		jsonData.push([data.departmentName, data.salaryAVG])
  	        	}
  	        	
          data.addRows( jsonData );
          // Instantiate and draw our chart, passing in some options.
          var chart = new google.visualization.BarChart(document.getElementById('chart_div2'));
          chart.draw(data, options);
  	        		
  	        })
    	  
      }
      
      function drawChart1() {
          // Set chart options
          var options = {'title':'부서별 인원수',
                         'width':400,
                         'height':300,
                         vAxis: { gridlines: { count: 4 } }               
          };
          
        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', '부서');
        data.addColumn('number', '인원수');
        
        //ajax로 호출
        let jsonData; //변수선언 여기.
        
	        $.ajax({
	        	url : "findStat", //.은 상대경로..
	        	//async : false //비동기. 차례대로 실행. 안하면 .done 나중에 실행됨.
	        })
	        .done(function(datas){
	        	//chart data
	        	jsonData = []; //배열로 초기화.
	        	for(let data of datas){
	        		jsonData.push([data.departmentName, data.cnt])
	        	}
	        	
		        data.addRows( jsonData );
		        
		        //chart draw
		        var chart = new google.visualization.LineChart(document.getElementById('chart_div1'));
		        chart.draw(data, options);
		        
		        //chart event
		        google.visualization.events.addListener(chart, 'select', function() {
		        	var col =  chart.getSelection()[0].column
		        	var col = chart.getSelection()[0].row
		        	console.log(jsonData[row][col], jsonData[row][0]);
        	});
	        		
	        })
        
      }
      
    </script>
  </head>

  <body>
    <!--Div that will hold the pie chart-->
    <div id="chart_div1"></div>
    <div id="chart_div2"></div>
  </body>
</html>