<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<link rel="css" href="https://fonts.googleapis.com/css?family=Open+Sans:400,700">

<style>
.chartdiv {
  font-family: "Open Sans", Arial;
  background: #FFF;
  
}
main {
  width: 500px;
  margin: 10px auto;
  padding: 10px 20px 30px;
  background: #FFF;
  box-shadow: 0 3px 5px rgba(0,0,0,0.2);
}
p {
  margin-top: 2rem;
  font-size: 13px;
}

#chart_div, #chart_div2 {
  width: 700px;
  height: 500px;
  position: relative;
  margin: auto;
  
}

#chart_div::before, #chart_div2::before {
  content: "";
  position: absolute;
  display: block;
  width: 250px;
  height: 30px;
  left: 250px;
  top: 421px;
  background: #FAFAFA;
  box-shadow: 1px 1px 0 0 #DDD;
}

#pie-chart {
  width: 700px;
  height: 350px;
  position: relative;
  margin: auto;
}
#pie-chart::before {
  content: "";
  position: absolute;
  display: block;
  width: 175px;
  height: 120px;
  left: 440px;
  top: 0;
  background: #FAFAFA;
  box-shadow: 1px 1px 0 0 #DDD;
}

#pie-chart::after {
  content: "";
  position: absolute;
  display: block;
  top: 370px;
  left: 140px;
  width: 170px;
  height: 2px;
  background: rgba(0,0,0,0.1);
  border-radius: 50%;
  box-shadow: 0 0 3px 4px rgba(0,0,0,0.1);
}
</style> 
 
      <!--Load the AJAX API-->
    <script type="text/javascript">
    <% request.getSession().setAttribute("pageName", "회원 통계"); %>
    
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
    
      function drawChart() {
        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', '기간');
        data.addColumn('number', '기간별 인원수');
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
        var options = {
        		/* 'title':'기간별 인원수',
                       'width':500,
                       'height':400 */
                       
            focusTarget: 'category',
      	    backgroundColor: 'transparent',
      	    colors: ['cornflowerblue', 'tomato','pink','green','yellow'],
      	    fontName: 'Open Sans',
      	    chartArea: {
      	      left: 50,
      	      top: 10,
      	      width: '100%',
      	      height: '70%'
      	    },
      	    bar: {
      	      groupWidth: '80%'
      	    },
      	    hAxis: {
      	      textStyle: {
      	        fontSize: 11
      	      }
      	    },
      	    vAxis: {
      	      minValue: 0,
      	      //maxValue: 100,
      	      baselineColor: '#DDD',
      	      gridlines: {
      	        color: '#DDD',
      	        count: 4
      	      },
      	      textStyle: {
      	        fontSize: 11
      	      }
      	    },
      	    legend: {
      	      position: 'bottom',
      	      textStyle: {
      	        fontSize: 12
      	      }
      	    },
      	    animation: {
      	      duration: 1200,
      	      easing: 'out',
      				startup: true
      	    }             
                       
        };

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
        data.addColumn('number', '전공별 인원수');
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
        var options1 = {
        		/* 'title':'전공별 인원수',
                       'width':500,
                       'height':400 */
          	focusTarget: 'category',
    	    backgroundColor: 'transparent',
    	    colors: ['tomato', 'cornflowerblue','pink','green','yellow'],
    	    fontName: 'Open Sans',
    	    chartArea: {
    	      left: 50,
    	      top: 10,
    	      width: '100%',
    	      height: '70%'
    	    },
    	    bar: {
    	      groupWidth: '80%'
    	    },
    	    hAxis: {
    	      textStyle: {
    	        fontSize: 11
    	      }
    	    },
    	    vAxis: {
    	      minValue: 0,
    	      //maxValue: 100,
    	      baselineColor: '#DDD',
    	      gridlines: {
    	        color: '#DDD',
    	        count: 4
    	      },
    	      textStyle: {
    	        fontSize: 11
    	      }
    	    },
    	    legend: {
    	      position: 'bottom',
    	      textStyle: {
    	        fontSize: 12
    	      }
    	    },
    	    animation: {
    	      duration: 1200,
    	      easing: 'out',
    				startup: true
    	    }             
        
        };

        // Instantiate and draw our chart, passing in some options.
        var chart1 = new google.visualization.ColumnChart(document.getElementById('chart_div2'));
        chart1.draw(data, options1);
      }
      </script>
      
      <!-- 해시차트 -->
      <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
  	  google.setOnLoadCallback(drawCharts3);
  	  function drawCharts3() {
  		  console.log("jsp해시")
		  // BEGIN PIE CHART
		  
		  // pie chart data
		
		  var pieOptions = {
		    backgroundColor: 'transparent',
		    pieHole: 0.4,
		    colors: [ "cornflowerblue", 
		              "olivedrab", 
		              "orange", 
		              "tomato", 
		              "crimson", 
		              "purple", 
		              "turquoise", 
		              "forestgreen", 
		              "navy", 
		              "gray"],
		    pieSliceText: 'key',
		    tooltip: {
		      text: 'percentage'
		    },
		    fontName: 'Open Sans',
		    chartArea: {
		      width: '100%',
		      height: '94%'
		    },
		    legend: {
		      textStyle: {
		        fontSize: 13
		      }
		    }
		  };
		  
		  var datatablepie = [];
		  datatablepie.push(['hash_tag', 'cnt']);
	      
	     	$.ajax({
	      	async : false,
	      	url :"../ajax/hashChart.do",
	      	dataType : "json",
	      	success : function(datas){
	      		console.log(datas);
	      		for(i=0; i<datas.length; i++){
	      			datatablepie.push([datas[i].hashtag_name, parseInt(datas[i].cnt)]);
	      		}
	      	}
	      });
	     	var pieData = google.visualization.arrayToDataTable(datatablepie);
		  
	     	var pieChart = new google.visualization.PieChart(document.getElementById('pie-chart'));
	  	  pieChart.draw(pieData, pieOptions);
  	  }
      </script>
      
      <script type="text/javascript">
		<%request.getSession().setAttribute("pageName", "회원 통계");%>
	  </script>
  </head>
  <body>
 
 <br><br> 
  
  <div class="regular-page-area">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="page-content">
						<h2 style="text-align: center;">관리자용 회원 통계 차트</h2>
						<div class="chartdiv">
						<br><br>
							<h5>기간별 인원수 차트 </h5>
							<br><br>
							<div id="chart_div"></div>
							<br><br>
							<h5>전공별 인원수 차트 </h5>
							<div id="chart_div2"></div>
							<br><br>
							<h5>회원별 해시태그 선호도통계</h5>
							<div id="pie-chart"></div>
						<br><br>
						</div>
					</div>
						<div class="single-course-content section-padding-100">
						</div>
				</div>
			</div>
		</div>
	</div>
<!--     <div id="chart_div"></div>
    <div id="chart_div2"></div> -->
  </body>
</html>