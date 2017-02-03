<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page='/include/header'  flush="false" />

    <!-- html -->
	<div class="w1200">
		<div style="height:40px;"></div>
			<div id="write_product">
				<div class="category_wrap info">
					<div class="wp text bold fl">CATEGORY</div>
					<select name="category" class="wp input fl">
						<option name="complete_bike">COMPLETE_BIKE</option>
						<option name="frame_fork">FRAME_FORK</option>
						<option name="wheelset">WHEELSET</option>
						<option name="tire_tube">TIRE_TUBE</option>
						<option name="rim_hub">RIM_HUB</option>
						<option name="handle">HANDLE</option>
						<option name="bartape_grip">BARTAPE_GRIP</option>
						<option name="stem">STEM</option>
						<option name="seatpost">SEATPOST</option>
						<option name="saddle">SADDLE</option>
						<option name="crank">CRANK</option>
						<option name="B.B">B.B</option>
						<option name="chain_cog">CHAIN_COG</option>
						<option name="pedal">PEDAL</option>
						<option name="strap_toeclip">STRAP_TOECLIP</option>
						<option name="helmet">HELMET</option>
						<option name="light">LIGHT</option>
						<option name="tool">TOOL</option>
						<option name="acc">ACC</option>
						<option name="custom_order">CUSTOM_ORDER</option>
					</select>
					<div class="clear"></div>
				</div>
				<div class="title_wrap info">
					<div class="wp text bold fl">TITLE</div>
					<input name="title" class="wp input fl" placeholder="input title"/>
					<div class="clear"></div>
				</div>
				<div class="brand_wrap info">
					<div class="wp text bold fl">BRAND</div>
					<input name="brand" class="wp input fl" placeholder="input BRAND"/>
					<div class="clear"></div>
				</div>
				<div class="price_wrap info">
					<div class="wp text bold fl">PRICE</div>
					<input name="price" class="wp input fl" placeholder="input PRICE"/>
					<div class="clear"></div>
				</div>
				<div class="point_wrap info">
					<div class="wp text bold fl">POINT</div>
					<input name="point" class="wp input fl" placeholder="input POINT"/>
					<div class="clear"></div>
				</div>
<!-- 				<div class="code_wrap info"> -->
<!-- 					<div class="wp text bold fl">CODE</div> -->
<!-- 					<input name="code" class="wp input fl" placeholder="input CODE"/> -->
<!-- 					<div class="clear"></div> -->
<!-- 				</div> -->
				<div class="size_wrap info">
					<div class="wp text bold fl">SIZE</div>
					<input name="size" class="wp input fl" placeholder="input SIZE"/>
					<div class="clear"></div>
				</div>
				<div class="qty_wrap info">
					<div class="wp text bold fl">수량</div>
					<input name="qty" class="wp input fl" placeholder="input QUANTITY"/>
					<div class="clear"></div>
				</div>
				<div class="content_title bold">CONTENTS</div>
				<textarea class="inputContents" name="editor1" if="editor1" rows="10" cols="80"></textarea>
				
				<div class="btn_wrap">
					<div class="btn_wp">
						<div class="btn submitBtn fl bold cp">submit</div>
						<div class="btn cancelBtn fl bold cp">cancel</div>
						<div class="clear"></div>
					</div>
					<div class="clear"></div>
				</div>		
			</div>
			<div style="height:40px;"></div>
	</div>
	
	
    <script>
    
    	$(function(){
    		shopId = location.href.split('#')[1];
    		
    		if(shopId != null){
    			getContents(shopId);
    		}
			//ckeditor    		
    		var editor_config = {
    				width:'100%',
    				height:'500px',
    				resize_enabled : false,
    				enterMode : CKEDITOR.ENTER_BR,
    				shiftEnterMode : CKEDITOR.ENTER_P,
    				removePlugins : "elementspath",
    				filebrowserUploadUrl : "${pageContext.request.contextPath}/admin/uploadImage"
    		};
    		var editor = CKEDITOR.replace('editor1',editor_config);
    		CKEDITOR.on('dialogDefinition',function(ev){
    			var dialogName = ev.data.name;
    			var dialogDefinition = ev.data.definition;
    			switch(dialogName){
    			case 'image':
    				dialogDefinition.removeContents('LINK');
    				dialogDefinition.removeContents('advanced');
    				break;
    			}
    		});	
    		
    		writeListener();
    		
    		
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
    	
    	function drawContents(data){
    		$('#write_product .category_wrap select').val(data.category_code.toUpperCase());
    		$('#write_product .title_wrap input').val(data.title);
    		$('#write_product .brand_wrap input').val(data.brand);
    		$('#write_product .price_wrap input').val(data.price);
    		$('#write_product .point_wrap input').val(data.point);
    		$('#write_product .size_wrap input').val(data.size);
    		$('#write_product .qty_wrap input').val(data.stock);
//     		$('#write_product .category_wrap .text').html(data.category_code);
//     		$('#write_product .inputTitle').val(data.title);
    		CKEDITOR.instances.editor1.setData(data.contents);
    		category = data.category_code;
    	}
    	
    	function insertContents(params){
    		console.log(params);
    		$.ajax({
    			url : base_url + "shop/insertShop.json",
    			type : "POST",
    			data : params,
    			success : function(data){
					console.log("::insertContents::",data);
					if(data.result == true){
						alert('상품을 성공적으로 등록하였습니다.');
						location.href = "onlineStore";
					}
    			},
    			error : function(err){
    				console.log("error");
    				console.log(err);
    			}
    		});
    	};
    	function updateContents(params){
    		$.ajax({
    			url : base_url + "shop/updateShop.json",
    			type : "POST",
    			data : params,
    			success : function(data){
					console.log("::updateContents::",data);
					if(data.result == true){
						alert('상품정보를 성공적으로 수정하였습니다.');
						location.href = "onlineStore";
					}
    			},
    			error : function(err){
    				console.log("error");
    				console.log(err);
    			}
    		});
    	}
    	
    	
    	function writeListener(){
    		$('#write_product .btn_wrap .btn_wp .submitBtn').off('click').on('click',function(){
    		// update
	   			if( shopId != null ){
	    			var params = {
    					shop_id : shopId,
    	    			title : $('#write_product [name="title"]').val(),
    	    			contents : CKEDITOR.instances.editor1.getData(),
    	    			price : $('#write_product [name="price"]').val(),
    	    			is_enable : 'Y',		
    					category_code : $('#write_product select option:selected').attr('name'),
    					point : $('#write_product [name="point"]').val(),
    					user_id : "4",
    	    			size : $('#write_product [name="size"]').val(),
    	    			stock : $('#write_product [name="qty"]').val(),
    	    			brand : $('#write_product [name="brand"]').val()
	    			};
	    			updateContents(params);
	   			// write
	   			}else{
	   				var params = {
   						title : $('#write_product [name="title"]').val(),
    	    			contents : CKEDITOR.instances.editor1.getData(),
    	    			price : $('#write_product [name="price"]').val(),
    	    			is_enable : 'Y',		
    	    			category_code : $('#write_product select option:selected').attr('name'),
    					point : $('#write_product [name="point"]').val(),
    					user_id : "4",
    	    			size : $('#write_product [name="size"]').val(),
    	    			stock : $('#write_product [name="qty"]').val(),
    	    			brand : $('#write_product [name="brand"]').val()	
	    			};
// 	   				console.log(params)
	   				insertContents(params);
	   			}
    			
    			
    		});
    		
    		$('#write_product .btn_wrap .btn_wp .cancelBtn').off('click').on('click',function(){
    			location.href = "onlineStore";
    		});
    	}
		
		 
    </script>
    
<jsp:include page='/include/footer'  flush="false" />