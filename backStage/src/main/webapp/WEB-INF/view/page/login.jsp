<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page='/include/header'  flush="false" />

    <!-- html -->
	<div id="login" class="login_component">
		<div style="height:40px;"></div>
		<div class="w1200">
			<div style="height:20px;"></div>
			<div class="login_area">
				<div class="login_wrap">
					<div class=" title bold">LOGIN</div>
					<div class="wp id">
						<div class="text bold">ID</div>
						<div class="input id"><input class="input_id"/></div>
					</div>
					<div class="wp pwd">
						<div class="text bold">PASSWORD</div>
						<div class="input pwd"><input type="password" class="input_pwd"/></div>
					</div>
					<div class="wp btn">
						<div class="btn login fl cp">LOGIN</div>
						<a href="join">
							<div class="btn join fl cp">JOIN</div>
						</a>
						<div class="clear"></div>
					</div>
				</div>
			</div>
		
		<div style="height:40px;"></div>
	</div>
	
	
    <script>
    	$(function(){
    		loginListener();
    	});
    	function checkLogin(data){
    		var userData = data;
    		$.ajax({
    			url : base_url + "auth/checkLogin.json",
    			type : "POST",
    			data : userData,
    			success : function(data){
    				sessionStorage.setItem('user_id',data.result.user_id);
    				sessionStorage.setItem('user_name',data.result.user_name);
    				sessionStorage.setItem('auth',data.result.level);
    				
    				if(data.result != null){
    					location.href='main';
    				}else{
    					alert("아이디/비밀번호가 틀렸습니다.");
    				}
    			},
    			error : function(err){
    				console.log("error");
    				console.log(err);
    			}
    		});
    		
    	}
    	
    	function loginListener(){
    		$('#login .login').off('click').on('click',function(){
    			var data = {
        				email : $('#login .input_id').val(),
        				password : $('#login .input_pwd').val()
        		}	
    			checkLogin(data);
    		});
    		$('#login .input_pwd').keydown(function(key){
    			var data = {
        				email : $('#login .input_id').val(),
        				password : $('#login .input_pwd').val()
        		}	
    			if(key.keyCode == 13){
    				checkLogin(data);
    			}
    		});
    	}
    </script>
    
<jsp:include page='/include/footer'  flush="false" />