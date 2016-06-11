<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page='/include/header'  flush="false" />

    <!-- html -->
	<div style="height:40px;"></div>
	<div id="main" class="main=_component">
		<div class="main_area main_brand"></div>
		<div class="main_area main_store">
			<div class="w1200">
				<div class="main_wrap">
					<div class="title bold">BEST COMPLETE BIKE</div>
					<div class="contents "></div>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<div class="main_area main_collection">
			<div class="w1200">
				<div class="main_wrap">
					<div class="title bold">COLLECTION</div>
					<div class="contents"></div>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<div class="main_area main_news">
			<div class="w1200">
			<div class="main_wrap">
					<div class="title bold">NEWS</div>
					<div class="contents"></div>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<div class="main_area main_location">
			<div id="map" class="main_map_wrap"></div>
		</div>
	</div>
	
	
    <script>
		 $(function(){
			console.log("test map");
			var mapOption = {
					center : {lat:37.483324, lng:127.126040},
					zoom : 17,
					scrollwheel : false,
					draggable : false 
			};
			/* var mapStyle = [
				                {
				                	stylers : [
													{ hue: "#222629" },
	        										{ saturation: 180 },
	        										{ lightness: -80 }, 
				                	           ]
				                },{
				                	 featureType: "road",
				                     elementType: "geometry",
				                     stylers: [
										{ hue: "#001A23" },
										{ saturation: 20 }, 
										{ lightness: -20 }, 
				                       	{ visibility: "simplified" }
				                     ]
				                },{
				                    featureType: "road",
				                    elementType: "labels",
				                    stylers: [
				                      { visibility: "off" }
				                    ]
				                }
			                ];
			var mapStyler = new google.maps.StyledMapType(mapStyle,{name:"Styled Map"});
			map.mapTypes.set('map_style',mapStyler);
			map.setMapTypeId('map_style'); */
			var map = new google.maps.Map(document.getElementById('map'),mapOption);
			
			
		 });
    </script>
    
<jsp:include page='/include/footer'  flush="false" />