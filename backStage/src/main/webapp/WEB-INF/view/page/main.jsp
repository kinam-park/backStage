<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page='/include/header'  flush="false" />

    <!-- html -->
	<div style="height:40px;"></div>
	<div id="main" class="main_component">
		<div class="main_area main_brand">
			<div class="img fl"></div>
			<div class="desc fl"></div>
			<div class="clear"></div>
		</div>
		<div class="main_area main_store">
			<div class="w1200">
				<div class="main_wrap hide">
					<div class="title_wp ">
						<div class="title bold">BEST COMPLETE BIKE</div>
					</div>
					<div class="main_wp ">
						<div class="contents">
							<div class="content no1 fl">
								<div class="img"></div>
								<div class="cont_wp">
									<div class="tag">new</div>
									<div class="bike_name">completeBike</div>
									<div class="price">200,000,000원</div>
								</div>
							</div>
							<div class="content no2 fl">
								<div class="img"></div>
								<div class="cont_wp">
									<div class="tag">new</div>
									<div class="bike_name">completeBike</div>
									<div class="price">200,000,000원</div>
								</div>
							</div>
							<div class="content no3 fl">
								<div class="img"></div>
								<div class="cont_wp">
									<div class="tag">new</div>
									<div class="bike_name">completeBike</div>
									<div class="price">200,000,000원</div>
								</div>
							</div>
							<div class="content no4 fl">
								<div class="img"></div>
								<div class="cont_wp">
									<div class="tag">new</div>
									<div class="bike_name">completeBike</div>
									<div class="price">200,000,000원</div>
								</div>
							</div>
							<div class="content no5 fl">
								<div class="img"></div>
								<div class="cont_wp">
									<div class="tag">new</div>
									<div class="bike_name">completeBike</div>
									<div class="price">200,000,000원</div>
								</div>
							</div>
							<div class="content no6 fl">
								<div class="img"></div>
								<div class="cont_wp">
									<div class="tag">new</div>
									<div class="bike_name">completeBike</div>
									<div class="price">200,000,000원</div>
								</div>
							</div>
							<div class="clear"></div>
						</div>
					</div>
					<!-- <div class="clear"></div> -->
				</div>
			</div>
		</div>
		<div class="main_area main_collection">
			<div class="w1200">
				<div class="main_wrap">
					<div class="title_wp">
						<div class="title bold ">COLLECTION</div>
					</div>
					<div class="main_wp grid_collection"> </div>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<div class="main_area main_news">
			<div class="w1200">
				<div class="main_wrap">
					<div class="title_wp">
						<div class="title bold">NEWS</div>
					</div>
					<div class="main_wp grid_news"></div>
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
			
			getCollectionContents();
			getNewsContents();
			mainListener();
			
		 });
		 
		 function getCollectionContents(){
			 $.ajax({
					url : base_url + "contents/getContentsList.json",
					type : "POST",
					data : {category_code:"COLLECTION"},
					success : function(data){
// 						console.log("::getCollectionContents::",data);
						$.when(drawCollectionContents(data.result)).then(initMasonry(".grid_collection"));
					},
					error : function(err){
						console.log("error");
						console.log(err);
					}
			});
		 }
		 
		 function getNewsContents(){
			 $.ajax({
				url : base_url + "contents/getContentsList.json",
				type : "POST",
				data : {category_code:"NEWS"},
				success : function(data){
// 					console.log("::getNewsContents::",data);
					$.when(drawNewsContents(data.result)).then(initMasonry(".grid_news"));
				},
				error : function(err){
					console.log("error");
					console.log(err);
				}
			});
		 }
		 
		 function drawCollectionContents(data){
// 			 console.log("::drawCollectionContents::",data);
			 var length;
			 data.length < 8 ? length = data.length : length = 8;
			 for(var i=0; i<length; i++){
					var html = tempCollectionContents(data[i],i);
		    		$('#main .main_collection .main_wrap .main_wp.grid_collection').append(html);
	    	}
		 }
		 
		 function drawNewsContents(data){
			 var length;
			 data.length < 8 ? length = data.length : length = 6;
			 for(var i=0; i<length; i++){
					var html = tempNewsContents(data[i]);
		    		$('#main .main_news .main_wrap .main_wp.grid_news').append(html);
	    	}
		 }
		 
		 function tempCollectionContents(data,i){
		    	var created_date = new Date(data.created_date).format("yyyy-MM-dd");
		    	var html = '';
		    	var no = i%3;
		    	if(no == 0){
		    		html += '<div class="grid-item cp" name="'+data.contents_id+'">';	
		    	}else{
		    		html += '<div class="grid-item cp grid-item--height'+no+'" name="'+data.contents_id+'">';
		    	}
		    	
		    	if(data.main_img != null){
			    	html += '	<div class="img fl" style="background-image:url('+data.main_img+');"></div>';
		    	}else{
		    		html += '	<div class="img fl" style="background-image:url(/backStage/resources/images/bg_default.png);"></div>';
		    	}
		    	html += '	<div class="collection_wp fl">';
		    	html += '		<div class="wp title ">'+data.title+'</div>';
		    	html += '		<div class="wp created_date ">'+created_date+'</div>';
		    	html += '	</div>';
		    	html += '	<div class="clear"></div>';
		    	html += '</div>';
		    	
		    	return html;
		 }
		 
		 function tempNewsContents(data){
		    	var created_date = new Date(data.created_date).format("yyyy-MM-dd");
		    	var html = '';
	    		html += '<div class="grid-item cp" name="'+data.contents_id+'">';	
		    	if(data.main_img != null){
			    	html += '	<div class="img fl" style="background-image:url('+data.main_img+');"></div>';
		    	}else{
		    		html += '	<div class="img fl" style="background-image:url(/backStage/resources/images/bg_default.png);"></div>';
		    	}
		    	html += '	<div class="news_wp fl">';
		    	html += '		<div class="wp title ">'+data.title+'</div>';
		    	html += '		<div class="wp created_date ">'+created_date+'</div>';
		    	html += '	</div>';
		    	html += '	<div class="clear"></div>';
		    	html += '</div>';
		    	return html;
		 }
		 
		 function mainListener(){
// 			$('.grid').masonry({
// 				  itemSelector: '.grid-item',
// 				  gutter:20,
// 				  isFitWidth: true
// 			}); 
			 
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
			
			$('#main .grid-item').off('click').on('click',function(){
				var name = $(this).attr('name');
				location.href = 'detailPage#'+name;
			});
		 }
		 
		 
    </script>
    
<jsp:include page='/include/footer'  flush="false" />