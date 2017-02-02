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
    		
//     		name = location.href.split('#')[1];
//     		getContents(name);
    	});
    	
    	function getContents(name){
    		$.ajax({
				url : base_url + "contents/getContents.json",
				type : "POST",
				data : {contents_id:name},
				success : function(data){
					console.log(data);
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
				url : base_url + "contents/deleteContents.json",
				type : "POST",
				data : {contents_id:name},
				success : function(data){
					console.log(data);
					history.back();
				},
				error : function(err){
					console.log("error");
					console.log(err);
				}
			});
    	}
    	
    	function drawContents(data){
    		$('#storeDetailPage .category').html(data.category_code);
//     		$('#storeDetailPage .title').html(data.title);
//     		$('#storeDetailPage .created_date').html(data.created_date);
    		$('#storeDetailPage .content_wrap').append(data.contents);
    		storeDetailPageListener();
    	}
    	
    	function storeDetailPageListener(){
    		$('#storeDetailPage .deleteBtn').off('click').on('click',function(){
    			var checkDelete = confirm('해당 컨텐츠를 삭제하시겠습니까?');
    			if(checkDelete == true){
    				deleteContents(name);
    			}
    		});
    		
    		$('#storeDetailPage .updateBtn').off('click').on('click',function(){
    			var checkDelete = confirm('해당 컨텐츠를 수정하시겠습니까?');
    			if(checkDelete == true){
    				location.href = 'write#'+name;
    			}
    		});
    	}
    	
    </script>
    
<jsp:include page='/include/footer'  flush="false" />