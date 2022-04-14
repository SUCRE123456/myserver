<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>toastgrid.jsp</title>
	<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
  	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
	<script>
	const data = 
	$(function(){
		
		const Grid = tui.Grid;
		const instance = new Grid({
			  el: document.getElementById('grid'), // Container element
			  columns: [
			    {
			      header: '번호',
			      name: 'employee_id'
			    },
			    {
			      header: '이름',
			      name: 'first_name',
			      editor: 'text'
			    },
			    {
				      header: '이메일',
				      name: 'email',
				      editor: 'text'
				    },
				    {
					      header: '담당',
					      name: 'job_id',
					    	  editor: {
					    		  type: 'select',
					    		  options: {
					              listItems: [
					                  { text: 'President', value: 'AD_PRES' },
					                  { text: 'Administrator', value: 'Assistant' },
					                  { text: 'Sales Manager', value: 'SA_MAN' },
					                  { text: 'IT_PROG', value: 'IT_PROG' }
					                ]
					              }}
					    },
			    {
			      header: '급여',
			      name: 'salary',
			      editor: 'text'
			    },
			    {
			      header: '입사일자',
			      name: 'hire_date',
			      editor: 'text'
			    }
			  ],
			  data: {
				  api : {  readData: { url: '/readEmp'} }
			  }
		
			});
			//ajax로 데이터 가져옴. 밑에 data에 대입.
		/* 	let jsonData;
			$.ajax({
				url : '../empSelect',
				async : false
			}).done(function(datas){
				
				jsonData = datas; 
	        	
				
			})
			
			instance.resetData(jsonData); // Call API of instance's public method */ //api 걸어서해줘보겠음.

			Grid.applyTheme('striped'); // Call API of static method
			
		        
		       
	})
	</script>
</head>
<body>
	<div id="grid"></div>
</body>
</html>