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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/lib/font-awesome-4.6.3/css/font-awesome.min.css"><!-- fontawesome -->
		
		<script src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/masonry.pkgd.min.js"></script>
		
		<script src="${pageContext.request.contextPath}/resources/lib/ckeditor/ckeditor.js"></script>
		<!-- <script  async defer type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB9xsq7BHX_2BFmYvYcPMpABARBR0z1SkU&callback=initMap"></script> -->
		<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB9xsq7BHX_2BFmYvYcPMpABARBR0z1SkU"></script>
        
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
						<div class="facebook_logo logo fl"><i class="fa fa-facebook-official fa-2x" aria-hidden="true"></i></div>
						<div class="instagram_logo logo fl"><i class="fa fa-instagram fa-2x"></i></div>
						<div class="clear"></div>
					</div>
				</div>
				<div class="user_info_wrap fr">
					<div class="info_wp">
						<div class="log_in wp fr">LOG-IN</div>
						<div class="shopping_cart wp fr">SHOPPING-CART</div>
						<div class="my_page wp fr">MYPAGE</div>
						<div class="user_info wp fr">안녕하세요&nbsp&nbspADMIN 님</div>
						<div class="clear"></div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="main_logo_area fl">
				<div class="main_logo"></div>
			</div>
			<div class="main_menu_area fl">
				<div class="menu_wrap">
					<span class="menu home cp" menu="main">HOME</span>
					<span class="menu collection cp" menu="collection">COLLECTION</span> 
					<span class="menu news cp" menu="news">NEWS</span>
					<span class="menu store cp" menu="onlineStore">ONLINE-STORE</span>
					<span class="menu location cp" menu="location">LOCATION</span>
					<span class="menu contact cp" menu="contact">CONTACT</span>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	
	<script>
	$(function(){
		var loc = location.href.split("page/")[1];
		$('#header .main_menu_area .menu_wrap .menu[menu='+loc+']').addClass('active');
		
		listener();
	});
	
	function listener(){
		$('#header .main_menu_area .menu_wrap .menu').off('click').on('click',function(){
			var menu = $(this).attr('menu');
			location.href = menu;
		});
	};
	
	
	</script>
