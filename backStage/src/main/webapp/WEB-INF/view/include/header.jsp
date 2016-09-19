<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/include.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/write.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/collection.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/news.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/onlineStore.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/location.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/join.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/detailPage.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/lib/font-awesome-4.6.3/css/font-awesome.min.css"><!-- fontawesome -->
		
		<script src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/masonry.pkgd.min.js"></script>
		
		<script src="${pageContext.request.contextPath}/resources/lib/ckeditor/ckeditor.js"></script>
		<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB9xsq7BHX_2BFmYvYcPMpABARBR0z1SkU"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
        
		<title>BackStage</title>
		<style>
		
 		
		</style>
	</head>
<body>
	<!-- html -->	
	<div id="header" class="header_component">
		<div class="w1200">
			<div class="user_info_area fl">
				<div class="sns_wrap fl">
					<div class="sns_wp">
						<a href="https://www.facebook.com/Back-stage-332711123589633/?fref=ts">
							<div class="facebook_logo logo cp fl"></div>
						</a>
						<a href="https://www.instagram.com/backstage_bike/">
							<div class="instagram_logo logo cp fl"></div>
						</a>
						<a href="http://blog.naver.com/100_stage/">
							<div class="blog_logo logo logo cp fl"></div>
						</a>
						<div class="clear"></div>
					</div>
				</div>
				<div class="user_info_wrap fr">
					<div class="info_wp">
						<div class="log_in wp fr cp">LOG-IN</div>
						<div class="log_out wp fr cp hide">LOG-OUT</div>
<!-- 						<div class="shopping_cart wp fr">SHOPPING-CART</div> -->
<!-- 						<div class="my_page wp fr">MYPAGE</div> -->
						<div class="user_info wp fr">Login 해주세요.</div>
						<div class="clear"></div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="main_logo_area hide fl">
				<div class="main_logo"></div>
			</div>
			<div class="main_menu_area fl">
				<div class="main_logo_wrap fl">
					<div class="main_logo"></div>
				</div>
				<div class="menu_wrap fl">
					<span class="menu home cp" menu="main">HOME</span>
					<span class="menu collection cp" menu="collection">COLLECTION</span> 
					<span class="menu news cp" menu="news">NEWS</span>
					<span class="menu store cp" menu="onlineStore">ONLINE-STORE</span>
					<span class="menu location cp" menu="location">LOCATION</span>
					<span class="menu contact cp" menu="contact">CONTACT</span>
				</div>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	
	
	<script>
	$(function(){
		window.base_url = "${pageContext.request.contextPath}"+"/";
		
		var loc = location.href.split("page/")[1];
		$('#header .main_menu_area .menu_wrap .menu[menu='+loc+']').addClass('active');
		if(loc == 'main'){
			$('#header .main_menu_area .main_logo_wrap .main_logo').addClass('hide');
			$('#header .main_logo_area').removeClass('hide');
		}else{
			$('#header .main_menu_area .main_logo_wrap .main_logo').removeClass('hide');
			$('#header .main_logo_area').addClass('hide');
		}
		
		if(sessionStorage.getItem('user_name') != null){
			$('#header .user_info').html('안녕하세요   '+sessionStorage.getItem('user_name')+' 님');
			$('#header .log_in ').addClass('hide');
			$('#header .log_out ').removeClass('hide');
		}
		if(sessionStorage.getItem('auth') != null){
			$('#' + loc +' .write').removeClass('hide');
		}
		
		headerListener();
	});
	
	function headerListener(){
		
		$('#header .main_menu_area .menu_wrap .menu').off('click').on('click',function(){
			var menu = $(this).attr('menu');
			if(menu == 'onlineStore' || menu == 'contact'){
				alert('준비중입니다.');
			}else{
				location.href = menu;
			}
		});
		
		$('#header .log_in').off('click').on('click',function(){
			location.href = 'login';
		});
		$('#header .log_out').off('click').on('click',function(){
			sessionStorage.clear();
			alert('로그아웃되었습니다.');
			location.href = 'main';
		});
		
		
	};
	
	
	</script>
