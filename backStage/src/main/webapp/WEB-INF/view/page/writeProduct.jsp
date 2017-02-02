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
						<option name="B">B.B</option>
						<option name="chain_cog">CHAIN_COG</option>
						<option name="pedal">PEDAL</option>
						<option name="strap_toeclip">STRAP_TOECLIP</option>
						<option name="helmet">HELMET</option>
						<option name="light">LIGHT</option>
						<option name="tool">TOOL</option>
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
				<div class="code_wrap info">
					<div class="wp text bold fl">CODE</div>
					<input name="code" class="wp input fl" placeholder="input CODE"/>
					<div class="clear"></div>
				</div>
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
    		var category = sessionStorage.getItem('category');
    		pageCode = location.href.split('#')[1];
    		if(pageCode != null){
    			getContents(pageCode);
    		}
    		if(category != null){
    			$('#write_product .category_wrap .text').html( category );
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
				url : base_url + "contents/getContents.json",
				type : "POST",
				data : {contents_id:code},
				success : function(data){
					drawContents(data.result);
				},
				error : function(err){
					console.log("error");
					console.log(err);
				}
			});
    	}
    	
    	function drawContents(data){
    		$('#write_product .category_wrap .text').html(data.category_code);
    		$('#write_product .inputTitle').val(data.title);
    		CKEDITOR.instances.editor1.setData(data.contents);
    		category = data.category_code;
    	}
    	
    	function insertContents(params){
    		console.log(params);
    		$.ajax({
//     			url : base_url + "contents/insertContents.json",
    			type : "POST",
    			data : params,
    			success : function(data){
// 					console.log(data);
					if(data.result == true){
						alert('게시물을 성공적으로 게시하였습니다.');
						location.href = sessionStorage.getItem('category').toLowerCase();
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
    			url : base_url + "contents/updateContents.json",
    			type : "POST",
    			data : params,
    			success : function(data){
// 					console.log(data);
					if(data.result == true){
						alert('게시물을 성공적으로 수정하였습니다.');
						location.href = category.toLowerCase();
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
   			if( pageCode != null ){
    			var params = {
    					contents_id : pageCode,
    					category : $('#write_product select').is(':selected',true).attr('name'),
    	    			title : $('#write_product [name="title"]').val(),
    	    			brand : $('#write_product [name="brand"]').val(),
    	    			price : $('#write_product [name="price"]').val(),
    	    			code : $('#write_product [name="code"]').val(),
    	    			size : $('#write_product [name="size"]').val(),
    	    			qty : $('#write_product [name="qty"]').val(),
    	    			contents : CKEDITOR.instances.editor1.getData(),
    	    			category_code : category,
    	    			is_enable : 'Y'		
    			};
   				updateContents(params);
   			}else{
   				var params = {
    					user_id : sessionStorage.getItem('user_id'),
//     	    			category_code : sessionStorage.getItem('category'),
    	    			category : $('#write_product select option:selected').attr('name'),
    	    			title : $('#write_product [name="title"] ').val(),
    	    			brand : $('#write_product [name="brand"]').val(),
    	    			price : $('#write_product [name="price"]').val(),
    	    			code : $('#write_product [name="code"]').val(),
    	    			size : $('#write_product [name="size"]').val(),
    	    			qty : $('#write_product [name="qty"]').val(),
    	    			contents : CKEDITOR.instances.editor1.getData(),
    	    			is_enable : 'Y'		
    			};
   				console.log(params)
   				insertContents(params);
   			}
    			
    			
    		});
    		
    		$('#write_product .btn_wrap .btn_wp .cancelBtn').off('click').on('click',function(){
    			location.href = category.toLowerCase();
    		});
    	}
		
		 
    </script>
    
<jsp:include page='/include/footer'  flush="false" />