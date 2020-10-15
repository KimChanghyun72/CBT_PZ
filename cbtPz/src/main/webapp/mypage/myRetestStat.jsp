<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myRetestStat</title>
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
#bar-chart {
  width: 700px;
  height: 500px;
  position: relative;
  margin: auto;
  
}
#line-chart {
  width: 700px;
  height: 500px;
  position: relative;
  margin: auto;

}
#bar-chart::before, #line-chart::before {
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

<script>

	<% request.getSession().setAttribute("pageName", "개인 통계"); %>
	
	var color = ['cornflowerblue','tomato','pink','green','yellow']
	
	google.load("visualization", "1", {packages:["corechart"]});
	google.setOnLoadCallback(drawCharts);
	function drawCharts() {
	  
	  // BEGIN BAR CHART

	  // actual bar chart data
        
	var data = new google.visualization.DataTable();
		data.addColumn('string', '과목');
		data.addColumn('number', '과목별 평균 점수');
		data.addColumn({type:'string', role:'style'});
        var datatable = [];
		
       	$.ajax({
        	async : false,
        	url :"${pageContext.request.contextPath}/ajax/myRetestStatBarChart.do",
        	dataType : "json",
        	success : function(datas){
        		console.log(datas);
        		for(i=0; i<datas.length; i++){
        			datatable.push([datas[i].solve_type_cd, parseInt(datas[i].avg),'color:'+color[i]]);
        		}
        	}
        });
       	
       	data.addRows(datatable);
       	//var barData = google.visualization.arrayToDataTable(datatableBar);
	  
	  
	  // set bar chart options
	  var barOptions = {
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
	      maxValue: 100,
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
	  // draw bar chart twice so it animates
	  //barChart.draw(barZeroData, barOptions);
	  var barChart = new google.visualization.ColumnChart(document.getElementById('bar-chart'));
	  barChart.draw(data, barOptions);
	  
	  // BEGIN LINE GRAPH
        var datatable = [];
        datatable.push(['day', '기출', '모의']);
        
       	$.ajax({
        	async : false,
        	url :"${pageContext.request.contextPath}/ajax/myRetestStatLineChart.do",
        	dataType : "json",
        	success : function(datas){
        		//console.log(datas);
        		for(i=0; i<datas.length; i++){
        			datatable.push([datas[i].day, parseInt(datas[i].avg1), parseInt(datas[i].avg2)]);
        		}
        	}
        });
       	var lineData = google.visualization.arrayToDataTable(datatable);
		
		
	  var lineOptions = {
	    backgroundColor: 'transparent',
	    colors: ['cornflowerblue', 'tomato'],
	    fontName: 'Open Sans',
	    focusTarget: 'category',
	    chartArea: {
	      left: 50,
	      top: 10,
	      width: '100%',
	      height: '70%'
	    },
	    hAxis: {
	      //showTextEvery: 12,
	      textStyle: {
	        fontSize: 11
	      },
	      baselineColor: 'transparent',
	      gridlines: {
	        color: 'transparent'
	      }
	    },
	    vAxis: {
	      minValue: 0,
	      maxValue: 100,
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

	  var lineChart = new google.visualization.LineChart(document.getElementById('line-chart'));
	  lineChart.draw(lineData, lineOptions);
	  
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
      	url :"${pageContext.request.contextPath}/ajax/myRetestStatPieChart.do",
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

</head>
<body>

<br><br>

	<div class="regular-page-area">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="page-content">
						<h2 style="text-align: center;">개인 통계 차트</h2>
						<div class="chartdiv">
						<br><br>
							<h5>과목별 평균 차트 </h5><h6 style="color: gray"> (${barday.minday} ~ ${barday.maxday})</h6>
							<br><br>
							<div id="bar-chart"></div>
							<br><br>
							<h5>일별 모의고사/기출고사 평균 차트 </h5><h6 style="color: gray"> (최근 7일치)</h6>
							<div id="line-chart"></div>
							<br><br>
							<h5>해시태그 차트</h5><h6 style="color: gray"> (${pieday.minday} ~ ${pieday.maxday})</h6>
							<br><br>
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

	<!-- <h2>Beautiful Google Charts</h2>
	<div id="chartdiv">
		<h5>Daily Page Hits</h5>
		<div id="bar-chart"></div>
		<h5>Traffic Over Time</h5>
		<div id="line-chart"></div>
		<h5>Page Hits per Country</h5>
		<div id="pie-chart"></div>
		<p>
			Google Charts can be <a
				href="https://google-developers.appspot.com/chart/">found here</a>.
		</p>
		<p>
			An original pen by 
		</p>
	</div> -->
</body>
</html>