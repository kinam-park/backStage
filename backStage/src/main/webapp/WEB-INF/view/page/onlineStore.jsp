<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page='/include/header'  flush="false" />

    <!-- html -->
	<div id="online_store" class="container store_component">
		<div style="height:40px;"></div>
		<div class="w1200">
			<!-- side menu start -->
			<div class="side_menu_area fl">
<!-- 				<div class="side_menu_wrap menu_1"> -->
<!-- 					<div class="side_menu_wp title">ALL PRODUCT</div> -->
<!-- 					<div class="side_menu_wp parts"> -->
<!-- 						<div class="wp all cp">ALL</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="side_menu_wrap menu_2"> -->
<!-- 					<div class="side_menu_wp title">Complete Bike</div> -->
<!-- 					<div class="side_menu_wp parts"> -->
<!-- 						<div class="wp 2015 cp">2015 SALE!</div> -->
<!-- 						<div class="wp 2016 cp">2016 COMPLETE BIKE</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
				<div class="side_menu_wrap menu_3">
<!-- 					<div class="side_menu_wp title">Components</div> -->
					<div class="side_menu_wp parts">
						<div class="wp complete_bike cp" name="complete_bike">COMPLETE BIKE</div>
						<div class="wp frame_fork cp" name="frame_fork">FRAME</div>
						<div class="wp wheelset cp" name="wheelset">WHEELSET</div>
						<div class="wp tire_tube cp" name="tire_tube">TIRE&TUBE</div>
						<div class="wp rim_hub cp" name="rim_hub">RIM&HUB</div>
						<div class="wp handle cp" name="handle">HANDLE</div>
						<div class="wp bartape_grip cp" name="bartape_grip">BARTAPE&GRIP</div>
						<div class="wp stem cp" name="stem">STEM</div>
						<div class="wp seatpost cp" name="seatpost">SEATPOST</div>
						<div class="wp saddle cp" name="saddle">SADDLE</div>
						<div class="wp crank cp" name="crank">CRANK</div>
						<div class="wp bb cp" name="bb">B.B</div>
						<div class="wp chain_cog cp" name="chain_cog">CHAINRING&COG</div>
						<div class="wp chain cp" name="chain">CHAIN</div>
						<div class="wp pedal cp" name="pedal">PEDAL</div>
						<div class="wp strap_toeclip cp" name="strap_toeclip">STRAP&TOECLIP</div>
						<div class="wp helmet cp" name="helmet">HELMET</div>
						<div class="wp light cp" name="light">LIGHT</div>
						<div class="wp tool cp" name="tool">TOOL</div>
						<div class="wp acc cp" name="acc">ACC</div>
						
						<div class="wp customorder cp" name="customorder">CUSTOM ORDER</div>
					</div>
				</div>
<!-- 				<div class="side_menu_wrap menu_4"> -->
<!-- 					<div class="side_menu_wp title">Accesary</div> -->
<!-- 					<div class="side_menu_wp parts"> -->
<!-- 						<div class="wp glove cp">GLOVE</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
			</div><!-- side menu end -->
			
			<!-- store start -->
			<div class="online_store_area fl">
				<div class="navi_wrap">
					<div class="wp navi_wp">
						<div class="text fr">HOME > ONLINE-STORE</div>
					</div>
					<div class="wp sort_wp">
						<div class="write bold cp fl hide">WRITE</div>
						<div class="text fr">최신순으로 정렬</div>
					</div>
				</div>
				<div style="height:20px;"></div>
				<div class="store_wrap grid">
				  <!-- <div class="grid-item">
				  	<div class="img fl"></div>
				  	<div class="store_wp fl">
						<div class="wp tag ">
							<div class="wp_tag tag_new fl"></div>
							<div class="wp_tag tag_hot fl"></div>
							<div class="wp_tag tag_nearlysoldout fl"></div>
							<div class="clear"></div>
						</div>
					  	<div class="wp title ">title</div>
					  	<div class="wp price ">200,000원</div> 
				  	</div>
				  	<div class="clear"></div>
				  </div>
				  <div class="grid-item grid-item--height1">
				  	<div class="img fl"></div>
				  	<div class="store_wp fl">
					  	<div class="wp tag ">
							<div class="wp_tag tag_new fl"></div>
							<div class="wp_tag tag_hot fl"></div>
							<div class="wp_tag tag_nearlysoldout fl"></div>
							<div class="clear"></div>
						</div>
					  	<div class="wp title ">title</div>
					  	<div class="wp price ">200,000원</div>
				  	</div>
				  	<div class="clear"></div>
				  </div>
				  <div class="grid-item grid-item--height2">
				  	<div class="img fl"></div>
				  	<div class="store_wp fl">
					  	<div class="wp tag ">
							<div class="wp_tag tag_new fl"></div>
							<div class="wp_tag tag_hot fl"></div>
							<div class="wp_tag tag_nearlysoldout fl"></div>
							<div class="clear"></div>
						</div>
					  	<div class="wp title ">title</div>
					  	<div class="wp price ">200,000원</div>
				  	</div>
				  	<div class="clear"></div>
				  </div>
				  <div class="grid-item grid-item--height3">
				  	<div class="img fl"></div>
				  	<div class="store_wp fl">
					  	<div class="wp tag ">
							<div class="wp_tag tag_new fl"></div>
							<div class="wp_tag tag_hot fl"></div>
							<div class="wp_tag tag_nearlysoldout fl"></div>
							<div class="clear"></div>
						</div>
					  	<div class="wp title ">title</div>
					  	<div class="wp price ">200,000원</div>
				  	</div>
				  	<div class="clear"></div>
				  </div>
				  
				  <div class="grid-item">
				  	<div class="img fl"></div>
				  	<div class="store_wp fl">
					  	<div class="wp tag ">
							<div class="wp_tag tag_new fl"></div>
							<div class="wp_tag tag_hot fl"></div>
							<div class="wp_tag tag_nearlysoldout fl"></div>
							<div class="clear"></div>
						</div>
					  	<div class="wp title ">title</div>
					  	<div class="wp price ">200,000원</div>
				  	</div>
				  	<div class="clear"></div>
				  </div>
				  <div class="grid-item grid-item--height1">
				  	<div class="img fl"></div>
				  	<div class="store_wp fl">
					  	<div class="wp tag ">
							<div class="wp_tag tag_new fl"></div>
							<div class="wp_tag tag_hot fl"></div>
							<div class="wp_tag tag_nearlysoldout fl"></div>
							<div class="clear"></div>
						</div>
					  	<div class="wp title ">title</div>
					  	<div class="wp price ">200,000원</div>
				  	</div>
				  	<div class="clear"></div>
				  </div>
				  <div class="grid-item grid-item--height2">
				  	<div class="img fl"></div>
				  	<div class="store_wp fl">
					  	<div class="wp tag ">
							<div class="wp_tag tag_new fl"></div>
							<div class="wp_tag tag_hot fl"></div>
							<div class="wp_tag tag_nearlysoldout fl"></div>
							<div class="clear"></div>
						</div>
					  	<div class="wp title ">title</div>
					  	<div class="wp price ">200,000원</div>
				  	</div>
				  	<div class="clear"></div>
				  </div>
				  <div class="grid-item grid-item--height3">
				  	<div class="img fl"></div>
				  	<div class="store_wp fl">
					  	<div class="wp tag ">
							<div class="wp_tag tag_new fl"></div>
							<div class="wp_tag tag_hot fl"></div>
							<div class="wp_tag tag_nearlysoldout fl"></div>
							<div class="clear"></div>
						</div>
					  	<div class="wp title ">title</div>
					  	<div class="wp price ">200,000원</div>
				  	</div>
				  	<div class="clear"></div>
				  </div>
				  
				  <div class="grid-item">
				  	<div class="img fl"></div>
				  	<div class="store_wp fl">
					  	<div class="wp tag ">
							<div class="wp_tag tag_new fl"></div>
							<div class="wp_tag tag_hot fl"></div>
							<div class="wp_tag tag_nearlysoldout fl"></div>
							<div class="clear"></div>
						</div>
					  	<div class="wp title ">title</div>
					  	<div class="wp price ">200,000원</div>
				  	</div>
				  	<div class="clear"></div>
				  </div>
				  <div class="grid-item grid-item--height1">
				  	<div class="img fl"></div>
				  	<div class="store_wp fl">
					  	<div class="wp tag ">
							<div class="wp_tag tag_new fl"></div>
							<div class="wp_tag tag_hot fl"></div>
							<div class="wp_tag tag_nearlysoldout fl"></div>
							<div class="clear"></div>
						</div>
					  	<div class="wp title ">title</div>
					  	<div class="wp price ">200,000원</div>
				  	</div>
				  	<div class="clear"></div>
				  </div>
				  <div class="grid-item grid-item--height2">
				  	<div class="img fl"></div>
				  	<div class="store_wp fl">
					  	<div class="wp tag ">
							<div class="wp_tag tag_new fl"></div>
							<div class="wp_tag tag_hot fl"></div>
							<div class="wp_tag tag_nearlysoldout fl"></div>
							<div class="clear"></div>
						</div>
					  	<div class="wp title ">title</div>
					  	<div class="wp price ">200,000원</div>
				  	</div>
				  	<div class="clear"></div>
				  </div>
				  <div class="grid-item grid-item--height3">
				  	<div class="img fl"></div>
				  	<div class="store_wp fl">
					  	<div class="wp tag ">
							<div class="wp_tag tag_new fl"></div>
							<div class="wp_tag tag_hot fl"></div>
							<div class="wp_tag tag_nearlysoldout fl"></div>
							<div class="clear"></div>
						</div>
					  	<div class="wp title ">title</div>
					  	<div class="wp price ">200,000원</div>
				  	</div>
				  	<div class="clear"></div>
				  </div> -->
				</div>
				
			</div><!-- store end -->
			
			<div class="clear"></div>
		</div>
		<div style="height:40px;"></div>
	</div>
	
	
    <script>
	$(function(){
		if(sessionStorage.getItem('auth') == 'admin'){
			$('#online_store .write').removeClass('hide');	
		}
		
		var currUrl = location.href;
		var code = null;
		if(currUrl.indexOf("#")>-1){
			code = currUrl.split("#")[1];
		}
		
		getStoreData(code);
// 		storeListener();
	});
	
	function getStoreData(code){
// 		console.log("::getStoreData::",code);
		$.ajax({
			url : base_url + "shop/getShopList.json",
			type : "POST",
			data : {category_code:code},
			success : function(data){
				console.log("::getStoreData::",data);
				$.when(drawContent(data.result)).then(function(){
					if(code){
						reloadMasonry('.grid');
					}else{
						initMasonry('.grid');	
					}
					
				});
			},
			error : function(err){
				console.log("error");
				console.log(err);
			}
		});
		
	}
	
	function drawContent(data){
		$('#online_store .online_store_area .store_wrap').empty();
		for(var i=0; i<data.length; i++){
			var html = tempContent(data[i],i);
			$('#online_store .online_store_area .store_wrap').append(html);
		}
		storeListener();
	}
	
	function tempContent(data,i){
		
		console.log("::tempContent DATA::",data);
		
		
		var no = i%4;
		
    	var html = '';
    	if(no == 0){
    		html += '<div class="grid-item grid-item--height cp" name="'+data.shop_id+'">';
    	}else{
			html += '<div class="grid-item grid-item--height'+(no+1)+' cp" name="'+data.shop_id+'"">';
    	}
		if(data.main_img != null){
// 			html += '	<div class="img fl" style="background-image:url('+data.main_img+');"></div>';
			html += '	<div class="img fl">';
			html += '		<img src='+data.main_img+'>';
			html += '	</div>';
		}else{
			html += '	<div class="img fl" style="background-image:url(/backStage/resources/images/bg_default.png);background-size:100%;"></div>';
		}
		html += '	<div class="store_wp fl">';
		html += '  		<div class="wp tag ">';
		if(countDate(data.created_date)<30){
			html += '			<div class="wp_tag tag_new fl"></div>';
		}
		if(data.stock < 10){
			html += '			<div class="wp_tag tag_hot fl"></div>';
		}
		if(data.stock == 0){
			html += '			<div class="wp_tag tag_soldout fl"></div>';
		}
		html += '			<div class="clear"></div>';
		html += '  		</div>';
		html += '		<div class="wp title ">'+data.title+'</div>';
		html += '		<div class="wp price ">₩ '+splitNum(data.price)+'</div>';
		html += '	</div>';
		html += '	<div class="clear"></div>';
		html += '</div>';
    	return html;
 	}
	
	function storeListener(){
		console.log("storeListener");
		$('#online_store .side_menu_area .side_menu_wrap .side_menu_wp .wp').off('click').on('click',function(){
			var categoryTab = $(this).attr('name');
			var currPage = null;
			location.href = "#"+categoryTab;
			getStoreData(categoryTab);
		});
		
		$('#online_store .grid-item').off('click').on('click',function(){
			console.log("grid-item click::");
			var shopId = $(this).attr('name');
			location.href = 'storeDetailPage#'+shopId;
		});
		
		$('#online_store .write').off('click').on('click',function(){
			location.href = 'writeProduct';
		});
		
		
	}
	
    </script>
    
<jsp:include page='/include/footer'  flush="false" />