<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page='/include/header'  flush="false" />

    <!-- html -->
	<div id="news" class="news_component">
		<div style="height:40px;"></div>
		<div class="w1200">
			<div class="news_area">
				<div class="navi_wrap">
					<div class="wp navi_wp">
						<div class="text fr">HOME > NEWS</div>
					</div>
					<div class="wp sort_wp">
						<div class="text fr">최신순으로 정렬</div>
					</div>
				</div>
			</div>
			<div style="height:20px;"></div>
			<div class="news_area">
				<div class="news_wrap grid">
<!-- 					<div class="grid-item"> -->
<!-- 					  	<div class="img "></div> -->
<!-- 					  	<div class="news_wp "> -->
<!-- 						  	<div class="wp title ">title</div> -->
<!-- 						  	<div class="wp created_date ">2016.08.22</div> -->
<!-- 					  	</div> -->
<!-- 					  	<div class="clear"></div> -->
<!-- 			  		</div> -->
<!-- 			  		<div class="grid-item"> -->
<!-- 					  	<div class="img "></div> -->
<!-- 					  	<div class="news_wp "> -->
<!-- 						  	<div class="wp title ">title</div> -->
<!-- 						  	<div class="wp created_date ">2016.08.22</div> -->
<!-- 					  	</div> -->
<!-- 					  	<div class="clear"></div> -->
<!-- 			  		</div> -->
<!-- 			  		<div class="grid-item"> -->
<!-- 					  	<div class="img "></div> -->
<!-- 					  	<div class="news_wp "> -->
<!-- 						  	<div class="wp title ">title</div> -->
<!-- 						  	<div class="wp created_date ">2016.08.22</div> -->
<!-- 					  	</div> -->
<!-- 					  	<div class="clear"></div> -->
<!-- 			  		</div> -->
<!-- 			  		<div class="grid-item"> -->
<!-- 					  	<div class="img "></div> -->
<!-- 					  	<div class="news_wp "> -->
<!-- 						  	<div class="wp title ">title</div> -->
<!-- 						  	<div class="wp created_date ">2016.08.22</div> -->
<!-- 					  	</div> -->
<!-- 					  	<div class="clear"></div> -->
<!-- 			  		</div> -->
<!-- 			  		<div class="grid-item"> -->
<!-- 					  	<div class="img "></div> -->
<!-- 					  	<div class="news_wp "> -->
<!-- 						  	<div class="wp title ">title</div> -->
<!-- 						  	<div class="wp created_date ">2016.08.22</div> -->
<!-- 					  	</div> -->
<!-- 					  	<div class="clear"></div> -->
<!-- 			  		</div> -->
<!-- 			  		<div class="grid-item"> -->
<!-- 					  	<div class="img "></div> -->
<!-- 					  	<div class="news_wp "> -->
<!-- 						  	<div class="wp title ">title</div> -->
<!-- 						  	<div class="wp created_date ">2016.08.22</div> -->
<!-- 					  	</div> -->
<!-- 					  	<div class="clear"></div> -->
<!-- 			  		</div> -->
			  		<div class="clear"></div>
				</div>
			</div>
			
		</div>
		
		<div style="height:40px;"></div>
	</div>
	
	
    <script>
    $(function(){
    	
		getContents();
	 });			
    
    function getContents(){
    	$.ajax({
			url : base_url + "contents/getContentsList.json",
			type : "POST",
			data : {category_code:"NEWS"},
			success : function(data){
				console.log(data);
				drawContents(data.result[0]);
			},
			error : function(err){
				console.log("error");
				console.log(err);
			}
		});
    }

    function drawContents(data){
    	for(var i=0; i<1; i++){
//     		var html = tempContents(data[i]);
			var html = tempContents();
    		$('#news .news_area .news_wrap.grid').append(html);
    	}
    	
    	newsListener();
    }
    
    function tempContents(data){
    	var html = '';
    	html += '<div class="grid-item cp">';
    	html += '	<div class="img "></div>';
    	html += '	<div class="news_wp ">';
    	html += '		<div class="wp title ">title</div>';
    	html += '		<div class="wp created_date ">2016.08.22</div>';
    	html += '	</div>';
    	html += '	<div class="clear"></div>';
    	html += '</div>';
    	
    	return html;
    }
    
    function newsListener(){
    	
		$('.grid').masonry({
			  itemSelector: '.grid-item',
			  gutter:20,
			  isFitWidth: true
		});
		
		$('.grid .grid-item').off('click').on('click',function(){
			console.log('test click event');
		});
		
    }
    </script>
    
<jsp:include page='/include/footer'  flush="false" />