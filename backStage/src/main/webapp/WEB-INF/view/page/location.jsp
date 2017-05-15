<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page='/include/header'  flush="false" />

    <!-- html -->
	<div id="location" class="container location_component">
		<div style="height:40px;"></div>
		<div class="w1200">
			<div class="location_area">
				<div class="navi_wrap">
					<div class="wp navi_wp">
						<div class="text fr">HOME > LOCATION</div>
					</div>
				</div>
				<div style="height:20px;"></div>
			</div>
			<div class="location_area">
				<div id="map" class="map_wrap fl"></div>
				<div class="info_wrap fl">
					<div class="wp find">
<!-- 						<div class="text">찾아오시는 길</div> -->
						<ul>
<!-- 						  <li> SUBWAY : 지하철 1번 환승  </li> -->
<!-- 						  <li> BUS : </li> -->
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<div style="height:40px;"></div>
	</div>
	
	
    <script>
    	$(function(){
    		var myLocation = {lat:37.483324, lng:127.126040};
    		var mapOption = {
					center : {lat:37.485376, lng:127.126061},
					zoom : 16,
					scrollwheel : false,
					draggable : false 
			};
    		var marker = new google.maps.Marker({
    			position : myLocation,
    			map : map,
    			animation : google.maps.Animation.DROP,
    			title : 'BACKSTAGE'
    		});
    		var info = '<div class="info_window"></div>'
    		var infowindow = new google.maps.InfoWindow({
    			content : info
    		});
			var map = new google.maps.Map(document.getElementById('map'),mapOption);
			marker.setMap(map);
			infowindow.open(map, marker);
    	});
    </script>
    
<jsp:include page='/include/footer'  flush="false" />