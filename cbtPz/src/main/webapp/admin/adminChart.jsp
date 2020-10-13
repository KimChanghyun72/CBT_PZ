<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
      <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
    
      function drawChart() {
        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', '기간');
        data.addColumn('number', '인원');
        var datatable = [];
        
       	$.ajax({
        	async : false,
        	url :"../ajax/studyChart.do",
        	dataType : "json",
        	success : function(datas){
        		for(i=0; i<datas.length; i++){
        			datatable.push([datas[i].study_term, parseInt(datas[i].cnt) ]);
        		}
        	}
        });   
        data.addRows(datatable);
    
        // Set chart options
        var options = {'title':'기간별 인원수',
                       'width':500,
                       'height':400};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
      </script>
     
     
     
      <script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart1);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart1() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', '전공');
        data.addColumn('number', '인원');
        var datatable = [];
        
       	$.ajax({
        	async : false,
        	url :"../ajax/majorChart.do",
        	dataType : "json",
        	success : function(datas){
        		for(i=0; i<datas.length; i++){
        			datatable.push([datas[i].is_major, parseInt(datas[i].cnt)]);
        		}
        	}
        });   
        data.addRows(datatable);
    
        // Set chart options
        var options1 = {'title':'전공별 인원수',
                       'width':500,
                       'height':400};

        // Instantiate and draw our chart, passing in some options.
        var chart1 = new google.visualization.ColumnChart(document.getElementById('chart_div2'));
        chart1.draw(data, options1);
      }
      </script>
      <script type="text/javascript">
		<%request.getSession().setAttribute("pageName", "회원 통계");%>
	  </script>
  </head>
  <body>
    <div id="chart_div"></div>
    <div id="chart_div2"></div>
  </body>
</html>