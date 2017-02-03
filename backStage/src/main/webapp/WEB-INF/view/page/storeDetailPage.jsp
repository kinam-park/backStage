<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page='/include/header'  flush="false" />

    <!-- html -->
	<div id="storeDetailPage" class="storeDetailPage_component">
		<div style="height:40px;"></div>
		<div class="w1200">
			<div style="height:20px;"></div>
			<div class="storeDetailPage_area">
				<div class="storeDetailInfo_wrap">
					<div class="storeDetailInfo_wp">
						<div class="detailImgs_wp fl"></div>
						<div class="detailInfo_wp fl">
							<div class="wp title_wp bold">LEADER KAGERO 2013</div>
							<hr>
							<div class="wp brand_wp">Brand : LEADER</div>
							<div class="wp price_wp">Price : 1,030,000원</div>
							<div class="wp code_wp">Code : K2016</div>
							<div class="wp size_wp">Size : 56</div>
							<div class="wp qty_wp">수량 : 1</div>
							<div class="wp btn_wp">
								<div class="btn_buy btn fl cp">BUY NOW</div>
								<div class="btn_mycart btn fl cp">ADD CART</div>
								<div class="btn_wishlist btn fl cp">WISHLIST</div>
								<div class="clear"></div>
							</div>
						</div>
						<div class="clear"></div>
					</div>
				</div>
				<div style="height:40px;"></div>
				<div class="storeDetailPage_wrap">
					<div class="category bold">Detail View</div>
<!-- 					<div class="head_wrap"> -->
<!-- 						<div class="wp title"></div> -->
<!-- 						<div class="wp created_date"></div> -->
<!-- 					</div> -->
					<div class="content_wrap"></div>
				</div>
				<div class="btn_wrap hide">
					<div class="wp updateBtn bold cp fl">UPDATE</div>
					<div class="wp deleteBtn bold cp fl">DELETE</div>
					<div class="clear"></div>
				</div>
			</div>
		<div style="height:40px;"></div>
	</div>
	
	
    <script>
    	$(function(){
    		var auth = sessionStorage.getItem('auth');
    		if(auth == 'admin'){
    			$('#storeDetailPage .btn_wrap').removeClass('hide');
    		}
    		
    		shopId = location.href.split('#')[1];
    		getContents(shopId);
    	});
    	
    	function getContents(code){
    		$.ajax({
				url : base_url + "shop/getShop.json",
				type : "POST",
				data : {shop_id:code},
				success : function(data){
					console.log("::getContents::",data);
					drawContents(data.result);
				},
				error : function(err){
					console.log("error");
					console.log(err);
				}
			});
    	}
    	
    	function deleteContents(code){
    		$.ajax({
				url : base_url + "shop/deleteShop.json",
				type : "POST",
				data : {shop_id:code},
				success : function(data){
					console.log(data);
					if(data.result == true){
						history.back();
					}else{
						alert("다시 시도하여주십시오.");
					}
				},
				error : function(err){
					console.log("error");
					console.log(err);
				}
			});
    	}
    	
    	function drawContents(data){
    		$('#storeDetailPage .detailImgs_wp').css('background-image','url('+data.main_img+')');
    		$('#storeDetailPage .title_wp').html(data.title);
    		$('#storeDetailPage .brand_wp').html("BRAND : "+data.brand);
    		$('#storeDetailPage .price_wp').html("PRICE : "+splitNum(data.price) + "원");
    		$('#storeDetailPage .code_wp').html("CODE : "+data.shop_id);
    		$('#storeDetailPage .size_wp').html("SIZE : "+data.size);
    		$('#storeDetailPage .content_wrap').append(data.contents);
    		storeDetailPageListener();
    	}
    	
    	function storeDetailPageListener(){
    		$('#storeDetailPage .deleteBtn').off('click').on('click',function(){
    			var checkDelete = confirm('해당 컨텐츠를 삭제하시겠습니까?');
    			if(checkDelete == true){
    				deleteContents(shopId);
    			}
    		});
    		
    		$('#storeDetailPage .updateBtn').off('click').on('click',function(){
    			var checkDelete = confirm('해당 컨텐츠를 수정하시겠습니까?');
    			if(checkDelete == true){
    				location.href = 'writeProduct#'+shopId;
    			}
    		});
    	}
    	
    </script>
    
<jsp:include page='/include/footer'  flush="false" />