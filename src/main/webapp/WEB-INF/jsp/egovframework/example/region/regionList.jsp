<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역별 약국 현황</title>
<jsp:include page="/WEB-INF/jsp/egovframework/example/cmmn/common_include.jsp"></jsp:include>
<jsp:include page="/WEB-INF/jsp/egovframework/example/cmmn/header.jsp"></jsp:include>


<!-- 차트 Resources -->
<script src="https://cdn.amcharts.com/lib/5/index.js"></script>
<script src="https://cdn.amcharts.com/lib/5/xy.js"></script>
<script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>

<script type="text/javascript">
	
	
	/** OnLoad event **/ 
	$(function() {
		fn_btnEvent();       // 버튼 이벤트 등록
		fn_phartable();      // 시각화(표) 구현
		fn_commas();         // 시각화(표)에 콤마찍기(,)
		fn_visualization();  // 시각화(차트) 구현 및 데이터 요청
	});
	
	
	/** 버튼 이벤트 등록 **/
	function fn_btnEvent() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault();

			var btnId = $(this).attr('id');

			switch (btnId) {
				case 'btnTop' :
					fn_scrollToTop();
					break;
			}
		});
	}
	
	
	/** 시각화(표) **/
	function fn_phartable() {		
		
	   var listcallback = function(returnvalue) {
		   // console.log(returnvalue);
		   $("#listregion").empty().append(returnvalue);
	   }
	   callAjax("../region/regionList.do", "post", "text", false, "", listcallback);
	}
	

	/** 시각화(차트) 구현 및 데이터 요청 **/
	function fn_visualization() {
		
		am5.ready(function() {
			
			// Create root element
			// https://www.amcharts.com/docs/v5/getting-started/#Root_element
			var root = am5.Root.new("chartdiv");
			
			// Set themes
			// https://www.amcharts.com/docs/v5/concepts/themes/
			root.setThemes([
			  am5themes_Animated.new(root)
			]);
			
			var data = [
			  {
			    name: "세종",
			    counts: "",
			    pictureSettings: {src: "<c:url value='/resources/images/sejong.png'/>"}
			  },
			  {
			    name: "제주",
			    counts: "",
			    pictureSettings: {src: "<c:url value='/resources/images/jeju.png'/>"}
			  },
			  {
			    name: "경남",
			    counts: "",
			    pictureSettings: {src: "<c:url value='/resources/images/gyeongnam.png'/>"}
			  },
			  {
			    name: "경북",
			    counts: "",
			    pictureSettings: {src: "<c:url value='/resources/images/gyeongbuk.png'/>"}
			  },
			  {
			    name: "전남",
			    counts: "",
			    pictureSettings: {src: "<c:url value='/resources/images/jeonnam.png'/>"}
			  },
			  {
			    name: "전북",
			    counts: "",
			    pictureSettings: {src: "<c:url value='/resources/images/jeonbuk.png'/>"}
			  },
			  {
			    name: "충남",
			    counts: "",
			    pictureSettings: {src: "<c:url value='/resources/images/chungnam.png'/>"}
			  },
			  {
			    name: "충북",
			    counts: "",
			    pictureSettings: {src: "<c:url value='/resources/images/chungbuk.png'/>"}
			  },
			  {
			    name: "강원",
			    counts: "",
			    pictureSettings: {src: "<c:url value='/resources/images/gangwon.png'/>"}
			  },
			  {
			    name: "경기",
			    counts: "",
			    pictureSettings: {src: "<c:url value='/resources/images/gyeonggi.png'/>"}
			  },
			  {
			    name: "울산",
			    counts: "",
			    pictureSettings: {src: "<c:url value='/resources/images/ulsan.png'/>"}
			  },
			  {
			    name: "대전",
			    counts: "",
			    pictureSettings: {src: "<c:url value='/resources/images/daejeon.png'/>"}
			  },
			  {
			    name: "광주",
			    counts: "",
			    pictureSettings: {src: "<c:url value='/resources/images/gwangju.png'/>"}
			  },
			  {
			    name: "대구",
			    counts: "",
			    pictureSettings: {src: "<c:url value='/resources/images/daegu.png'/>"}
			  },
			  {
			    name: "인천",
			    counts: "",
			    pictureSettings: {src: "<c:url value='/resources/images/incheon.png'/>"}
			  },
			  {
			    name: "부산",
			    counts: "",
			    pictureSettings: {src: "<c:url value='/resources/images/busan.png'/>"}
			  },
			  {
			    name: "서울",
			    counts: "",
			    pictureSettings: {src: "<c:url value='/resources/images/seoul.png'/>"}
			  },
			  
			];
			
			
			// Create chart
			// https://www.amcharts.com/docs/v5/charts/xy-chart/
			var chart = root.container.children.push(
			  am5xy.XYChart.new(root, {
			    panX: false,
			    panY: false,
			    wheelX: "none",
			    wheelY: "none",
			    paddingTop: 40,
			    paddingLeft: 50,
			    paddingRight: 40
			  })
			);
			
			
			/** 시각화(차트) 구현을 위한 JSON 데이터 받기 **/
			function fn_getJSON() {
				
				// fn_getJSON() 내에서 데이터 업데이트
				var callback = function(returndata) {
					// console.log(returndata);
					
					var str = $.parseJSON(JSON.stringify(returndata));  //parse JSON
					var str_list = str.list;
					
					var parsedData = $.parseJSON(JSON.stringify(str_list));  //parse JSON
					var listLen = parsedData.length;
					
					// returndata에서 key가 counts인 값들만 뽑아오는 배열(countsDataFromDB) 만들기
					var countsDataFromDB = [];
			        for (var i=0; i<listLen; i++) {
			           var items = JSON.stringify(parsedData[i]);
			           var item = $.parseJSON(items);  //parse JSON
			           // console.log(item);
			           
			           // 만들어진 배열을 countsDataFromDB에 저장
			           // 역순으로 저장해야하기 때문에 .push 대신, .unshift 활용
			           if (item.hasOwnProperty("counts")) {
			               countsDataFromDB.unshift(item.counts);
			           } else {
			        	   console.log("잘못됨");
			           };
			        }
			        
		     		// JSON 데이터 17건이 담긴 countsDataFromDB를
			        // 차트 데이터('data')에 업데이트
			        for (var i=0; i<data.length; i++) {
			            data[i].counts = countsDataFromDB[i];
			        }
			        console.log(data);

				    // 차트 업데이트
				    series.data.setAll(data);
				}
				callAjax("../region/visualJSON.do", "get", "json", true, "", callback);
			}
			
			// DB 데이터 호출 및 'data' 업데이트
			fn_getJSON();
			
			
			// Create axes
			// https://www.amcharts.com/docs/v5/charts/xy-chart/axes/
			
			var yRenderer = am5xy.AxisRendererY.new(root, {});
			yRenderer.grid.template.set("visible", false);
			
			var yAxis = chart.yAxes.push(
			  am5xy.CategoryAxis.new(root, {
			    categoryField: "name",
			    renderer: yRenderer,
			    paddingRight:40
			  })
			);
			
			var xRenderer = am5xy.AxisRendererX.new(root, {});
			xRenderer.grid.template.set("strokeDasharray", [3]);
			
			var xAxis = chart.xAxes.push(
			  am5xy.ValueAxis.new(root, {
			    min: 0,
			    renderer: xRenderer
			  })
			);
			
			// Add series
			// https://www.amcharts.com/docs/v5/charts/xy-chart/series/
			var series = chart.series.push(
			  am5xy.ColumnSeries.new(root, {
			    name: "Income",
			    xAxis: xAxis,
			    yAxis: yAxis,
			    valueXField: "counts",
			    categoryYField: "name",
			    sequencedInterpolation: true,
			    calculateAggregates: true,
			    maskBullets: false,
			    tooltip: am5.Tooltip.new(root, {
			      dy: -20,
			      pointerOrientation: "vertical",
			      labelText: "{valueX}"
			    })
			  })
			);
			
			series.columns.template.setAll({
			  strokeOpacity: 0,
			  cornerRadiusBR: 10,
			  cornerRadiusTR: 10,
			  cornerRadiusBL: 10,
			  cornerRadiusTL: 10,
			  maxHeight: 20,
			  fillOpacity: 0.8
			});
			
			var currentlyHovered;
			
			series.columns.template.events.on("pointerover", function(e) {
			  handleHover(e.target.dataItem);
			});
			
			series.columns.template.events.on("pointerout", function(e) {
			  handleOut();
			});
			
			function handleHover(dataItem) {
			  if (dataItem && currentlyHovered != dataItem) {
			    handleOut();
			    currentlyHovered = dataItem;
			    var bullet = dataItem.bullets[0];
			    bullet.animate({
			      key: "locationX",
			      to: 1,
			      duration: 600,
			      easing: am5.ease.out(am5.ease.cubic)
			    });
			  }
			}
			
			function handleOut() {
			  if (currentlyHovered) {
			    var bullet = currentlyHovered.bullets[0];
			    bullet.animate({
			      key: "locationX",
			      to: 0,
			      duration: 600,
			      easing: am5.ease.out(am5.ease.cubic)
			    });
			  }
			}
			
			
			var circleTemplate = am5.Template.new({});
			
			series.bullets.push(function(root, series, dataItem) {
			  var bulletContainer = am5.Container.new(root, {});
			  var circle = bulletContainer.children.push(
			    am5.Circle.new(
			      root,
			      {
			        radius: 20
			      },
			      circleTemplate
			    )
			  );
			
			  var maskCircle = bulletContainer.children.push(
			    am5.Circle.new(root, { radius: 15 })
			  );
			
			  // only containers can be masked, so we add image to another container
			  var imageContainer = bulletContainer.children.push(
			    am5.Container.new(root, {
			      mask: maskCircle
			    })
			  );
			
			  // not working
			  var image = imageContainer.children.push(
			    am5.Picture.new(root, {
			      templateField: "pictureSettings",
			      centerX: am5.p50,
			      centerY: am5.p50,
			      width: 25,
			      height: 25,
			    })
			  );
			
			  return am5.Bullet.new(root, {
			    locationX: 0,
			    sprite: bulletContainer
			  });
			});
			
			// heatrule
			series.set("heatRules", [
			  {
			    dataField: "valueX",
			    min: am5.color(0xe5dc36),
			    max: am5.color(0x5faa46),
			    target: series.columns.template,
			    key: "fill"
			  },
			  {
			    dataField: "valueX",
			    min: am5.color(0xe5dc36),
			    max: am5.color(0x5faa46),
			    target: circleTemplate,
			    key: "fill"
			  }
			]);
			
			// series.data.setAll(data);
			yAxis.data.setAll(data);
			
			var cursor = chart.set("cursor", am5xy.XYCursor.new(root, {}));
			cursor.lineX.set("visible", false);
			cursor.lineY.set("visible", false);
			
			cursor.events.on("cursormoved", function() {
			  var dataItem = series.get("tooltip").dataItem;
			  if (dataItem) {
			    handleHover(dataItem)
			  }
			  else {
			    handleOut();
			  }
			})
			
			// Make stuff animate on load
			// https://www.amcharts.com/docs/v5/concepts/animations/
			series.appear();
			chart.appear(1000, 100);
			
			}); // end am5.ready()
		
	}
	
	
</script>

</head>
<body>
	<div class="container" id="wrapper">
	
		<!-- 시각화 표출 상단(페이지 타이틀) -->
		<div class="d-flex justify-content-center my-5">
			<div>
				<h1 class="fw-bold">지역별 약국 현황</h1>
			</div>		
		</div>
		
		<!-- 시각화 표출 영역 (1.표 / 2.차트) -->
		<div class="d-flex" style="width:100%;">
		
			<!-- 1.표 -->
			<div style="float:left; width:30%;">
				
				<table class="table table-hover">
					<colgroup>
							<col width="50%">
							<col width="50%">
					</colgroup>
					<thead>
						<tr>
							<th>시도 이름</th>
							<th>(단위: 개소)</th>
						</tr>
					</thead>
					<tbody id="listregion">
					</tbody>
				</table>
				
				<!-- 1.표(전체개수출력) -->
				<div>
					<span></span>
				</div>
				
			</div>
			
			<!-- 2.차트 -->
			<div id="chartdiv" style="float:right; width:100%; height:800px;">
			</div>
			
		</div>
		
		<!-- 위로가기 버튼 -->
		<div class="d-flex justify-content-end">
			<a href="#" id="btnTop">
			  <h1>
			    <i class="bi bi-arrow-up-circle-fill text-success"></i>
			  </h1>
			</a>
		</div>
		
	</div>
	
	<!-- 푸터 영역 -->
	<jsp:include page="/WEB-INF/jsp/egovframework/example/cmmn/footer.jsp"></jsp:include>
	
</body>
</html>