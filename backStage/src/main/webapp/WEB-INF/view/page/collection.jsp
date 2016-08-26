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
						<div class="text fr">최신순으로 정렬</div>
					</div>
				</div>
			</div>
			<div style="height:20px;"></div>
			<div class="collection_area">
				<div class="collection_wrap grid">
					<div class="grid-item">
					  	<div class="img fl"></div>
					  	<div class="collection_wp fl">
						  	<div class="wp title ">title</div>
						  	<div class="wp created_date ">2016.08.22</div>
					  	</div>
					  	<div class="clear"></div>
			  		</div>
					<div class="grid-item ">
						<div class="img fl"></div>
						<div class="collection_wp fl">
					 	<div class="wp title ">title</div>
					 	<div class="wp created_date ">2016.08.22</div>
						</div>
						<div class="clear"></div>
					</div>
					<div class="grid-item ">
						<div class="img fl"></div>
						<div class="collection_wp fl">
					 	<div class="wp title ">title</div>
					 	<div class="wp created_date ">2016.08.22</div>
						</div>
						<div class="clear"></div>
					</div>
					<div class="grid-item ">
						<div class="img fl"></div>
						<div class="collection_wp fl">
					 	<div class="wp title ">title</div>
					 	<div class="wp created_date ">2016.08.22</div>
						</div>
						<div class="clear"></div>
					</div>
					<div class="grid-item">
						<div class="img fl"></div>
						<div class="collection_wp fl">
					 	<div class="wp title ">title</div>
					 	<div class="wp created_date ">2016.08.22</div>
						</div>
						<div class="clear"></div>
					</div>
					<div class="grid-item ">
						<div class="img fl"></div>
						<div class="collection_wp fl">
					 	<div class="wp title ">title</div>
					 	<div class="wp created_date ">2016.08.22</div>
						</div>
						<div class="clear"></div>
					</div>
					<div class="grid-item ">
						<div class="img fl"></div>
						<div class="collection_wp fl">
					 	<div class="wp title ">title</div>
					 	<div class="wp created_date ">2016.08.22</div>
						</div>
						<div class="clear"></div>
					</div>
					<div class="grid-item ">
						<div class="img fl"></div>
						<div class="collection_wp fl">
					 	<div class="wp title ">title</div>
					 	<div class="wp created_date ">2016.08.22</div>
						</div>
						<div class="clear"></div>
					</div>
					<div class="grid-item">
						<div class="img fl"></div>
						<div class="collection_wp fl">
					 	<div class="wp title ">title</div>
					 	<div class="wp created_date ">2016.08.22</div>
						</div>
						<div class="clear"></div>
					</div>
					<div class="grid-item ">
						<div class="img fl"></div>
						<div class="collection_wp fl">
					 	<div class="wp title ">title</div>
					 	<div class="wp created_date ">2016.08.22</div>
						</div>
						<div class="clear"></div>
					</div>
					<div class="grid-item ">
						<div class="img fl"></div>
						<div class="collection_wp fl">
					 	<div class="wp title ">title</div>
					 	<div class="wp created_date ">2016.08.22</div>
						</div>
						<div class="clear"></div>
					</div>
					<div class="grid-item ">
						<div class="img fl"></div>
						<div class="collection_wp fl">
						 	<div class="wp title ">title</div>
						 	<div class="wp created_date ">2016.08.22</div>
						</div>
						<div class="clear"></div>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<div style="height:40px;"></div>
	</div>
	
	
    <script>
    $(function(){
		$('.grid').masonry({
			  itemSelector: '.grid-item',
			  gutter:20,
			  isFitWidth: true
		});
	 });
    </script>
    
<jsp:include page='/include/footer'  flush="false" />