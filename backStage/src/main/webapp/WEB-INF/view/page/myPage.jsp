<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page='/include/header'  flush="false" />

    <!-- html -->
	<div id="my_info" class="my_info_component">
		<div style="height:40px;"></div>
		<div class="w1200">
			<div class="side_menu_area fl">
				<div class="side_menu_wrap">
					<div class="wp user_info cp bold">회원정보수정</div>
					<div class="wp delivery_info cp ">주문정보확인</div>
					<div class="wp user_list cp ">사용자 리스트</div>
					<div class="wp delivery_list cp ">주문 리스트</div>
				</div>
			</div>
			<div class="user_info_area fl">
				<div class="user_info_wrap">
					<table>
						<colgroup>
							<col width="150">
							<col width="60">
							<col width="70">
							<col width="70">
							<col width="60">
							<col width="60">
							<col width="60">
							<col width="60">
						</colgroup>
						<tr>
							<th>ID(E-MAIL)</th>
							<td colspan="2"><input class="email input_email_1" disabled /></td>
							<td colspan="1" class="at">@</td>
							<td colspan="2"><input class="email input_email_2" disabled /></td>
						</tr>
						<tr>
							<th>PASSWORD</th>
							<td colspan="3"><input type="password" class="input_pwd"/></td>
						</tr>
						<tr>
							<th>CHECK PASSWORD</th>
							<td colspan="3"><input type="password" class="check_pwd"/></td>
						</tr>
						<tr>
							<th>USER NAME</th>
							<td colspan="3"><input class="input_name"/></td>
						</tr>
						<tr>
							<th>BIRTH DAY</th>
							<td colspan="3"><input placeholder="2016-00-00" class="input_birth_day"/></td>
						</tr>
						<tr>
							<th>PHONE</th>
							<td colspan="1" class="input_phone">
								<select class="input_phone_select fl">
									<option class="010" name="010">010</option>
									<option class="011" name="011">011</option>
									<option class="016" name="016">016</option>
									<option class="017" name="017">017</option>
									<option class="018" name="018">018</option>
									<option class="019" name="019">019</option>
								</select>
								<div class="bar fl">-</div>
							</td>
							<td colspan="1"><input class="input_phone_1 fl"/><div class="bar fl">-</div></td>
							<td colspan="1"><input class="input_phone_2"/></td>
						</tr>
						<tr>
							<th>ZIP CODE</th>
							<td colspan="1"><input class="input_zip_code"/></td>
							<td colspan="2"><div class="find_zipcode cp">우편번호</td></td>
						</tr>
						<tr>
							<th>ADDRESS</th>
							<td colspan="4"><input class="input_addr_1"/></td>
						</tr>
						<tr>
							<th>DETAIL ADDRESS</th>
							<td colspan="4"><input class="input_addr_2"/></td>
						</tr>
					</table>
					<div class="btn_wrap">
						<div class="wp submit fl bold cp">UPDATE</div>
						<div class="wp cancel fl bold cp">CANCEL</div>
						<div class="clear"></div>
					</div>
				</div>
			</div>
			<div class="user_delivery_area fl hide">
				<div class="user_delivery_wrap">
					
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<div style="height:40px;"></div>
	</div>
	
	
    <script>
    	$(function(){
    		getMyInfo();
    		myInfoListener();
    	});
    	
    	function getMyInfo(){
    		$.ajax({
    			url : base_url + "auth/getMyInfo.json",
    			type : "POST",
    			success : function(data){
    				console.log("::getMyInfo::",data);
    				drawMyInfo(data.result);
    			},
    			error : function(err){
    				console.log("error");
    				console.log(err);
    			}
    		});
    	}
    	
    	function drawMyInfo(data){
    		$(".user_info_area .user_info_wrap .input_email_1").val(data.email.split("@")[0]);
    		$(".user_info_area .user_info_wrap .input_email_2").val(data.email.split("@")[1]);
    		$(".user_info_area .user_info_wrap .input_name").val(data.user_name);
    		$(".user_info_area .user_info_wrap .input_birth_day").val(data.birthday.split(" ")[0]);
    		$(".user_info_area .user_info_wrap .input_phone_select").val(data.phone.substring(0,3));
    		$(".user_info_area .user_info_wrap .input_phone_1").val(data.phone.substring(3,7));
    		$(".user_info_area .user_info_wrap .input_phone_2").val(data.phone.substring(7,11));
    		$(".user_info_area .user_info_wrap .input_zip_code").val(data.zipcode);
    		$(".user_info_area .user_info_wrap .input_addr_1").val(data.addr1);
    		$(".user_info_area .user_info_wrap .input_addr_2").val(data.addr2);
    	}
    	
    	function updateUser(data){
    		var inputData = data;
    		$.ajax({
    			url : base_url + "auth/updateUser.json",
    			type : "POST",
    			data : inputData,
    			success : function(data){
    				console.log(data);
    				if(data.result == true){
    					alert('회원정보가 수정되었습니다.');
    					location.reload();
    				}
    			},
    			error : function(err){
    				console.log("error");
    				console.log(err);
    			}
    		});
    	}
    	
    	// cart List
    	function getPaymentList(){
    		$.ajax({
				url : base_url + "payment/getPaymentList.json",
				type : "POST",
				success : function(data){
					console.log("::getCartList::",data);
// 					drawCartList(data.result);
				},
				error : function(err){
					console.log("error");
					console.log(err);
				}
			});
    	}
    	
    	function myInfoListener(){
    		var email, phone;
    		
    		$('#my_info .find_zipcode').off('click').on('click',function(){
    			new daum.Postcode({
    				oncomplete : function(data){
    					$("#my_info .input_zip_code").val(data.zonecode);
    					$("#my_info .input_addr_1").val(data.roadAddress);
    				}
    			}).open();
    		});
    		
    		$('#my_info .submit').off('click').on('click',function(){
    			email = $('#my_info .input_email_1').val() + '@' + $('#my_info .input_email_2').val(); 
    			phone = $('#my_info .input_phone .input_phone_select').val() + $('#my_info .input_phone_1').val() + $('#my_info .input_phone_2').val();
    			var password = $('#my_info .input_pwd').val();
    			var password_check = $('#my_info .check_pwd').val();
    			var birthday_format = /[12][0-9]{3}-[01][0-9]-[0-3][0-9]/;
    			
    			var data = {
        				email : email,
        				password : password,
        				user_name : $('#my_info .input_name').val(),
        				birthday : $('#my_info .input_birth_day').val(),
        				phone : phone,
        				addr1 : $('#my_info .input_addr_1').val(),
        				addr2 : $('#my_info .input_addr_2').val(),
        				zipcode : $('#my_info .input_zip_code').val()
        			}
    			
    			if(password == ''){
    				alert('패스워드를 입력해 주세요.');
    			}else if((password == password_check) == false){
    				alert('패스워드가 일치하지 않습니다.');
    				$('#my_info .input_pwd').val('');
    				$('#my_info .check_pwd').val('');
    			}else if($('#my_info .input_name') == ''){
    				alert('사용자 이름을 입력해 주세요.');
    			}else if(! birthday_format.test($('#my_info .input_birth_day').val()) || $('#my_info .input_birth_day') == ''){
    				alert('생년월일을 정확히 입력해 주세요.');
    				$('#my_info .input_birth_day').val('');
    			}else if($('#my_info .input_phone_1') == '' || $('#my_info .input_phone_2') == ''){
    				alert('핸드폰 번호를 정확히 입력해 주세요.');
    			}else if($('#my_info .input_zip_code') == ''){
    				alert('주소를 입력해 주세요.');
    			}else if($('#my_info .input_addr_2') == ''){
    				alert('상세 주소를 입력해 주세요.');
    			}else{
    				updateUser(data);	
    			}

    		});
    		
    		$('#my_info .delivery_info').off('click').on('click',function(){
    			$('#my_info .delivery_info').addClass('bold');
    			$('#my_info .user_info').removeClass('bold');
    			$('#my_info .user_info_area').addClass('hide');
    			$('#my_info .user_delivery_area').removeClass('hide');
    			if(location.href.indexOf("#") > -1){
    				location.href = location.href.split("#")[0] + '#delivery';
    			}else{
	    			location.href = location.href + '#delivery';
    			}
    			getPaymentList();
    		});
    		
    		$('#my_info .user_info').off('click').on('click',function(){
    			$('#my_info .user_info').addClass('bold');
    			$('#my_info .delivery_info').removeClass('bold');
    			$('#my_info .user_delivery_area').addClass('hide');
    			$('#my_info .user_info_area').removeClass('hide');
    			if(location.href.indexOf("#") > -1){
    				location.href = location.href.split("#")[0] + '#user';
    			}else{
	    			location.href = location.href + '#user';
    			}
    		});
    		
    	}
    
    </script>
    
<jsp:include page='/include/footer'  flush="false" />