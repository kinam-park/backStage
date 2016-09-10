<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page='/include/header'  flush="false" />

    <!-- html -->
	<div id="join" class="join_component">
		<div style="height:40px;"></div>
		<div class="w1200">
			<div style="height:20px;"></div>
			<div class="join_area">
				<div class="join_wrap">
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
							<td colspan="2"><input class="email input_email_1"/></td>
							<td colspan="1" class="at">@</td>
							<td colspan="2"><input class="email input_email_2"/></td>
							<td colspan="2"><div class="check_id cp"/>CHECK ID</td>
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
						<div class="wp submit fl bold cp">SUBMIT</div>
						<div class="wp cancel fl bold cp">CANCEL</div>
						<div class="clear"></div>
					</div>
				</div>
			</div>
		</div>
		<div style="height:40px;"></div>
	</div>
	
	
    <script>
    	$(function(){
    		joinListener();
    	});
    	
    	function checkValidate(email){
    		$.ajax({
    			url : base_url + "auth/checkValidate.json",
    			type : "POST",
    			data : {email : email},
    			success : function(data){
    				console.log(data);
    				if(data.result == false){
    					alert('이미 등록되어 있는 이메일 주소입니다.');
    					$('#join .email').val('');
    				}else{
    					alert('사용가능한 아이디입니다.');
    					$('#join .check_id').addClass('check');
    					$('#join .input_pwd').focus();
    				}
    			},
    			error : function(err){
    				console.log("error");
    				console.log(err);
    			}
    		});
    	}
    	
    	function insertUser(data){
    		var inputData = data;
    		$.ajax({
    			url : base_url + "auth/insertUser.json",
    			type : "POST",
    			data : inputData,
    			success : function(data){
    				console.log(data);
    				if(data.result == true){
    					alert('회원가입이 되었습니다.');
    					location.href = 'login';
    				}
    				
    			},
    			error : function(err){
    				console.log("error");
    				console.log(err);
    			}
    		});
    	}
    	
    	function joinListener(){
    		var email, phone;
    		$('#join .check_id').off('click').on('click',function(){
    			email = $('#join .input_email_1').val() + '@' + $('#join .input_email_2').val();
    			checkValidate(email);
    		});
    		
    		$('#join .find_zipcode').off('click').on('click',function(){
    			new daum.Postcode({
    				oncomplete : function(data){
    					$("#join .input_zip_code").val(data.zonecode);
    					$("#join .input_addr_1").val(data.roadAddress);
    				}
    			}).open();
    		});
    		
    		$('#join .submit').off('click').on('click',function(){
    			email = $('#join .input_email_1').val() + '@' + $('#join .input_email_2').val(); 
    			phone = $('#join .input_phone .input_phone_select').val() + $('#join .input_phone_1').val() + $('#join .input_phone_2').val();
    			var password = $('#join .input_pwd').val();
    			var password_check = $('#join .check_pwd').val();
    			var birthday_format = /[12][0-9]{3}-[01][0-9]-[0-3][0-9]/;
    			
    			var data = {
        				email : email,
        				password : password,
        				user_name : $('#join .input_name').val(),
        				birthday : $('#join .input_birth_day').val(),
        				phone : phone,
        				addr1 : $('#join .input_addr_1').val(),
        				addr2 : $('#join .input_addr_2').val(),
        				zipcode : $('#join .input_zip_code').val()
        			}
    			
    			if($('#join .input_email_1') == ''){
    				alert('e-mail을 입력해 주세요.');
    			}else if($('#join .input_email_2') == ''){
    				alert('e-mail 상세 주소를 입력해 주세요.');
    			}else if(password == ''){
    				alert('패스워드를 입력해 주세요.');
    			}else if((password == password_check) == false){
    				alert('패스워드가 일치하지 않습니다.');
    				$('#join .input_pwd').val('');
    				$('#join .check_pwd').val('');
    			}else if($('#join .input_name') == ''){
    				alert('사용자 이름을 입력해 주세요.');
    			}else if(! birthday_format.test($('#join .input_birth_day').val()) || $('#join .input_birth_day') == ''){
    				alert('생년월일을 정확히 입력해 주세요.');
    				$('#join .input_birth_day').val('');
    			}else if($('#join .input_phone_1') == '' || $('#join .input_phone_2') == ''){
    				alert('핸드폰 번호를 정확히 입력해 주세요.');
    			}else if($('#join .input_zip_code') == ''){
    				alert('주소를 입력해 주세요.');
    			}else if($('#join .input_addr_2') == ''){
    				alert('상세 주소를 입력해 주세요.');
    			}else{
    				insertUser(data);	
    			}

    		});
    		
    	}
    
    </script>
    
<jsp:include page='/include/footer'  flush="false" />