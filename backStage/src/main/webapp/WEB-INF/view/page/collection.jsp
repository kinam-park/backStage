<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page='/include/header'  flush="false" />

    <!-- html -->
	<div id="collection" class="collection_component">
		<div style="height:40px;"></div>
		<div class="w1200">
			<div class="collection_area">
				<div class="navi_wrap">
					<div class="wp navi_wp">
						<div class="text fr">HOME > COLLECTION</div>
					</div>
					<div class="wp sort_wp">
						<div class="write bold cp fl hide">WRITE</div>
						<div class="text fr">최신순으로 정렬</div>
						<div class="clear"></div>
					</div>
				</div>
			</div>
			<div style="height:20px;"></div>
			<div class="collection_area">
				<div class="collection_wrap grid">
<!-- 					<div class="grid-item"> -->
<!-- 					  	<div class="img fl"></div> -->
<!-- 					  	<div class="collection_wp fl"> -->
<!-- 						  	<div class="wp title ">title</div> -->
<!-- 						  	<div class="wp created_date ">2016.08.22</div> -->
<!-- 					  	</div> -->
<!-- 					  	<div class="clear"></div> -->
<!-- 			  		</div> -->
<!-- 					<div class="grid-item "> -->
<!-- 						<div class="img fl"></div> -->
<!-- 						<div class="collection_wp fl"> -->
<!-- 					 	<div class="wp title ">title</div> -->
<!-- 					 	<div class="wp created_date ">2016.08.22</div> -->
<!-- 						</div> -->
<!-- 						<div class="clear"></div> -->
<!-- 					</div> -->
<!-- 					<div class="grid-item "> -->
<!-- 						<div class="img fl"></div> -->
<!-- 						<div class="collection_wp fl"> -->
<!-- 					 	<div class="wp title ">title</div> -->
<!-- 					 	<div class="wp created_date ">2016.08.22</div> -->
<!-- 						</div> -->
<!-- 						<div class="clear"></div> -->
<!-- 					</div> -->
<!-- 					<div class="grid-item "> -->
<!-- 						<div class="img fl"></div> -->
<!-- 						<div class="collection_wp fl"> -->
<!-- 					 	<div class="wp title ">title</div> -->
<!-- 					 	<div class="wp created_date ">2016.08.22</div> -->
<!-- 						</div> -->
<!-- 						<div class="clear"></div> -->
<!-- 					</div> -->
<!-- 					<div class="grid-item"> -->
<!-- 						<div class="img fl"></div> -->
<!-- 						<div class="collection_wp fl"> -->
<!-- 					 	<div class="wp title ">title</div> -->
<!-- 					 	<div class="wp created_date ">2016.08.22</div> -->
<!-- 						</div> -->
<!-- 						<div class="clear"></div> -->
<!-- 					</div> -->
<!-- 					<div class="grid-item "> -->
<!-- 						<div class="img fl"></div> -->
<!-- 						<div class="collection_wp fl"> -->
<!-- 					 	<div class="wp title ">title</div> -->
<!-- 					 	<div class="wp created_date ">2016.08.22</div> -->
<!-- 						</div> -->
<!-- 						<div class="clear"></div> -->
<!-- 					</div> -->
<!-- 					<div class="grid-item "> -->
<!-- 						<div class="img fl"></div> -->
<!-- 						<div class="collection_wp fl"> -->
<!-- 					 	<div class="wp title ">title</div> -->
<!-- 					 	<div class="wp created_date ">2016.08.22</div> -->
<!-- 						</div> -->
<!-- 						<div class="clear"></div> -->
<!-- 					</div> -->
<!-- 					<div class="grid-item "> -->
<!-- 						<div class="img fl"></div> -->
<!-- 						<div class="collection_wp fl"> -->
<!-- 					 	<div class="wp title ">title</div> -->
<!-- 					 	<div class="wp created_date ">2016.08.22</div> -->
<!-- 						</div> -->
<!-- 						<div class="clear"></div> -->
<!-- 					</div> -->
<!-- 					<div class="grid-item"> -->
<!-- 						<div class="img fl"></div> -->
<!-- 						<div class="collection_wp fl"> -->
<!-- 					 	<div class="wp title ">title</div> -->
<!-- 					 	<div class="wp created_date ">2016.08.22</div> -->
<!-- 						</div> -->
<!-- 						<div class="clear"></div> -->
<!-- 					</div> -->
<!-- 					<div class="grid-item "> -->
<!-- 						<div class="img fl"></div> -->
<!-- 						<div class="collection_wp fl"> -->
<!-- 					 	<div class="wp title ">title</div> -->
<!-- 					 	<div class="wp created_date ">2016.08.22</div> -->
<!-- 						</div> -->
<!-- 						<div class="clear"></div> -->
<!-- 					</div> -->
<!-- 					<div class="grid-item "> -->
<!-- 						<div class="img fl"></div> -->
<!-- 						<div class="collection_wp fl"> -->
<!-- 					 	<div class="wp title ">title</div> -->
<!-- 					 	<div class="wp created_date ">2016.08.22</div> -->
<!-- 						</div> -->
<!-- 						<div class="clear"></div> -->
<!-- 					</div> -->
<!-- 					<div class="grid-item "> -->
<!-- 						<div class="img fl"></div> -->
<!-- 						<div class="collection_wp fl"> -->
<!-- 						 	<div class="wp title ">title</div> -->
<!-- 						 	<div class="wp created_date ">2016.08.22</div> -->
<!-- 						</div> -->
<!-- 						<div class="clear"></div> -->
<!-- 					</div> -->
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<div style="height:40px;"></div>
	</div>
	
	
    <script>
    $(function(){
		getContents();
// 		collectionListener();
		
	 });
    
    function getContents(){
    	$.ajax({
			url : base_url + "contents/getContentsList.json",
			type : "POST",
			data : {category_code:"COLLECTION"},
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
    
    function drawContents(data){
    	console.log(':::drawContents:::',data);
    	for(var i=0; i<data.length; i++){
			var html = tempContents(data[i]);
    		$('#collection .collection_area .collection_wrap.grid').append(html);
    	}
    	
    	collectionListener();
    }
    
    function tempContents(data){
    	var created_date = new Date(data.created_date).format("yyyy-MM-dd");
    	var html = '';
    	html += '<div class="grid-item cp" name="'+data.contents_id+'">';
    	if(data.main_img != null){
	    	html += '	<div class="img" style="background-image:url('+data.main_img+');"></div>';
    	}else{
    		html += '	<div class="img" style="background-image:url(/backStage/resources/images/bg_default.png);"></div>';
    	}
    	html += '	<div class="collection_wp ">';
    	html += '		<div class="wp title ">'+data.title+'</div>';
    	html += '		<div class="wp created_date ">'+created_date+'</div>';
    	html += '	</div>';
    	html += '	<div class="clear"></div>';
    	html += '</div>';
    	
    	return html;
    }
    
    function collectionListener(){
    	$('.grid').masonry({
			  itemSelector: '.grid-item',
			  gutter:20,
			  isFitWidth: true
		});
    	
    	$('.grid .grid-item').off('click').on('click',function(){
    		var name = $(this).attr('name');
			location.href = 'detailPage#'+name;
		});
    	
    	$('#collection .write').off('click').on('click',function(){
			sessionStorage.setItem('category','COLLECTION');
			location.href = 'write';
		});
    	
    }
    </script>
    
<jsp:include page='/include/footer'  flush="false" />