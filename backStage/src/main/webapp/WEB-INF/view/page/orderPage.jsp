<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page='/include/header'  flush="false" />

    <!-- html -->
	<div id="order" class="order_component">
		<div style="height:40px;"></div>
		<div class="w1200">
			<div class="title bold">ORDER</div>
			<div style="height:20px;"></div>
			<div class="order_area">
				<div class="info_wrap order_wrap">
					<table>
						<thead>
							<tr>
								<th>Image</th>
								<th>Info</th>
								<th>Price</th>
								<th>QTY</th>
								<th>Point</th>
								<th>Total</th>
								<th>Select</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td name="image"></td>
								<td name="info"></td>
								<td name="price"></td>
								<td name="qty"></td>
								<td name="point"></td>
								<td name="total"></td>
								<td><div class="btn_style delete_btn cp">DELETE</div></td>
								<td><div class="btn_style update_btn cp">UPDATE</div></td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="7">
									<div class="total_price bold fr"></div>
									<div class="fr">[합계] : &nbsp</div>
									<div class="fr">&nbsp=&nbsp</div>
									<div class="delivery_price fr" price="3000"> 3,000원</div>
									<div class="fr">[배송비]&nbsp</div>
									<div class="fr">&nbsp+&nbsp</div>
									<div class="order_price fr"></div>
									<div class="fr">[상품구매금액]&nbsp</div>
									<div class="order_cnt fr"></div>
									<div class="fr">[총 개수]&nbsp</div>
									<div class="clear"></div>
								</td>
							</tr>						
						</tfoot>
					</table>
				</div>
				<div style="height:20px;"></div>
				<div class="info_wrap user_info_wrap">
					<div class="title bold">주문자 정보</div>
					<div class="info_wp user_info_wp">
						<table>
							<thead>
								<colgroup>
									<col width="150">
									<col width="150">
									<col width="150">
									<col width="150">
								</colgroup>
							</thead>
							<tbody>
								<tr>
									<th>주문하시는 분</th>
									<td><input class="order_name"/></td>
								</tr>
								<tr>
									<th rowspan="3">주소</th>
									<td>
										<input class="order_zip" placeholder="우편번호" />
									</td>
									<td>
										<input type="text" class="search_zip cp bold" readonly value="우편번호" />
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<input class="order_addr1" placeholder="기본주소" />
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<input class="order_addr2" placeholder="나머지 주소" />
									</td>
								</tr>
								<tr>
									<th>휴대전화</th>
									<td><input class="order_phone" placeholder="휴대전화" /></td>
								</tr>
								<tr>
									<th>E-MAIL</th>
									<td><input class="order_email" placeholder="E-MAIL" /></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div style="height:20px;"></div>
				<div class="info_wrap delivery_info_wrap">
					<div class="title bold">배송지 정보</div>
					<div class="info_wp delivery_info_wp">
						<table>
							<thead>
								<colgroup>
									<col width="150">
									<col width="150">
									<col width="150">
									<col width="150">
								</colgroup>
							</thead>
							<tbody>
								<tr>
									<th>배송지 선택</th>
									<td class="delivery_wp">
										<input class="delivery_btn user" type="radio"/>
										<label class="delivery_btn2 user" >주문자와 동일</label>
									</td>
									<td class="delivery_wp new">
										<input class="delivery_btn new" type="radio"/>
										<label class="delivery_btn2 new" >새로운 배송지</label>
									</td>
								</tr>
								<tr class="new">
									<th>받으시는 분</th>
									<td><input class="order_name"/></td>
								</tr>
								<tr class="new">
									<th rowspan="3">주소</th>
									<td>
										<input class="order_zip" placeholder="우편번호" />
									</td>
									<td>
										<input type="text" class="search_zip cp bold" readonly value="우편번호" />
									</td>
								</tr>
								<tr class="new">
									<td colspan="2">
										<input class="order_addr1" placeholder="기본주소" />
									</td>
								</tr>
								<tr class="new">
									<td colspan="2">
										<input class="order_addr2" placeholder="나머지 주소" />
									</td>
								</tr>
								<tr class="new">
									<th>휴대전화</th>
									<td><input class="order_phone" placeholder="휴대전화" /></td>
								</tr>
								<tr class="new">
									<th>E-MAIL</th>
									<td><input class="order_email" placeholder="E-MAIL" /></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="btn_wrap">
					<div class="btn_style buy_btn cp">BUY NOW</div>
				</div>
			</div>
		
		<div style="height:40px;"></div>
	</div>
	
	
    <script>
    	$(function(){
    		getCartList();
    		getUserInfo();
    		orderListener();
    	});
    	
    	// cart List
    	function getCartList(){
    		$.ajax({
				url : base_url + "cart/getCartList.json",
				type : "POST",
				success : function(data){
					console.log("::getCartList::",data);
					drawCartList(data.result);
// 					orderListener();
				},
				error : function(err){
					console.log("error");
					console.log(err);
				}
			});
    	}
    	
    	function drawCartList(data){
    		$('#order .order_area .order_wrap table tbody').empty();
    		orderPrice=0; 
    		totalPrice=0;
    		totalCnt=0;
    		goodsName="";
    		moid = "";
    		for(var i=0; i<data.length; i++){
    			var html = tempCartList(data[i]);
    			$('#order .order_area .order_wrap table tbody').append(html);
    			orderPrice += data[i].price*1*data[i].stock*1;
    			totalCnt += data[i].stock*1;
    			
    			if(i==0){
	    			goodsName += data[i].title+"("+data[i].stock+")";
	    			moid += data[i].user_id+data[i].cart_id;
    			}else{
    				goodsName += ","+data[i].title+"("+data[i].stock+")";
    				moid += "-"+data[i].cart_id;
    			}
    		}
    		
    		totalPrice = orderPrice+$('#order .delivery_price').attr('price')*1;
    		//order_cnt
    		$('#order .order_cnt').html(splitNum(totalCnt)+"원");
    		$('#order .order_price').html(splitNum(orderPrice)+"원");
    		$('#order .total_price').html( splitNum(totalPrice) +"원");
    		
    	}
    	
    	function tempCartList(data){
    		var html = '';
			html += '<tr order_id="'+data.order_id+'" shop_id="'+data.shop_id+'">';
			html += '	<td class="image" ><img src="'+data.main_img+'"></td>';
			html += '	<td class="info">'+data.title+'</td>';
			html += '	<td class="price">'+splitNum(data.price)+'</td>';
			html += '	<td class="qty"><input type="text" value="'+data.stock+'"/></td>';
			html += '	<td class="point">'+splitNum(data.price*0.01)+'</td>';
			html += '	<td class="total">'+splitNum(data.price*1*data.stock*1)+'</td>';
			html += '	<td>';
			html += '	<div class="btn_style delete_btn cp">DELETE</div>'
			html += '	<div class="btn_style update_btn cp">UPDATE</div>';
			html += '	</td>';
			html += '</tr>';
    		return html;
    	}
    	
    	function deleteCartItem(code){
    		$.ajax({
				url : base_url + "order/deleteCart.json",
				type : "POST",
				data : {order_id:code},
				success : function(data){
					console.log("::deleteCartItem::",data);
					if(data.result == true){
						location.reload();
					}else{
						alert("다시 시도해 주십시오.");
					}
				},
				error : function(err){
					console.log("error");
					console.log(err);
				}
			});
    	}
    	
    	function updateCartItem(params){
    		$.ajax({
				url : base_url + "order/updateCart.json",
				type : "POST",
				data : {order_id:params.orderId,shop_id:params.shopId,stock:params.stock},
				success : function(data){
					console.log("::updateCartItem::",data);
					if(data.result == false){
						alert("다시 시도해 주십시오.");
					}else{
						location.reload();
					}
				},
				error : function(err){
					console.log("error");
					console.log(err);
				}
			});
    	}
    	
    	// user Info
    	function getUserInfo(){
    		$.ajax({
				url : base_url + "auth/getMyInfo.json",
				type : "POST",
				success : function(data){
					console.log("::getUserInfo::",data);
					drawUserInfo(data.result);
				},
				error : function(err){
					console.log("error");
					console.log(err);
				}
			});
    	}
    	
    	function drawUserInfo(data){
    		$('#order .user_info_wrap .order_name').val(data.user_name);
    		$('#order .user_info_wrap .order_zip').val(data.zipcode);
    		$('#order .user_info_wrap .order_addr1').val(data.addr1);
    		$('#order .user_info_wrap .order_addr2').val(data.addr2);
    		$('#order .user_info_wrap .order_phone').val(data.phone);
    		$('#order .user_info_wrap .order_email').val(data.email);
    	}
    	
    	function orderListener(){
    		$('#order .delete_btn').off('click').on('click',function(){
    			var code = $(this).parent().parent().attr("order_id");
    			deleteCartItem(code);
    		});
    		
    		$('#order .update_btn').off('click').on('click',function(){
    			var params = {};
    			params.orderId = $(this).parent().parent().attr("order_id");
    			params.shopId = $(this).parent().parent().attr("shop_id");
    			params.stock = $("#order .update_btn").parent().siblings(".qty").find("input").val()*1;
    			updateCartItem(params);
    		});
    		
    		$('#order .delivery_btn.user').off('click').on('click',function(){
    			$('#order .delivery_btn.new').prop('checked',false);
    			if($('#order .user_info_wrap .order_name').val() == ''){
    				alert('신규 배송지로 입력해 주십시오.');
    			}else{
    				$('#order .delivery_info_wrap .order_name').val($('#order .user_info_wrap .order_name').val());
    				$('#order .delivery_info_wrap .order_zip').val($('#order .user_info_wrap .order_zip').val());
    				$('#order .delivery_info_wrap .order_addr1').val($('#order .user_info_wrap .order_addr1').val());
    				$('#order .delivery_info_wrap .order_addr2').val($('#order .user_info_wrap .order_addr2').val());
    				$('#order .delivery_info_wrap .order_phone').val($('#order .user_info_wrap .order_phone').val());
    				$('#order .delivery_info_wrap .order_email').val($('#order .user_info_wrap .order_email').val());
    			}
    		});
    		
    		
    		$('#order .delivery_btn.new').off('click').on('click',function(){
    			$('#order .delivery_btn.user').prop('checked',false);
    			$('#order .delivery_info_wrap .order_name').val('');
    			$('#order .delivery_info_wrap .order_zip').val('');
    			$('#order .delivery_info_wrap .order_addr1').val('');
    			$('#order .delivery_info_wrap .order_addr2').val('');
    			$('#order .delivery_info_wrap .order_phone').val('');
    			$('#order .delivery_info_wrap .order_email').val('');
    		});
    		
    		$('#order .delivery_info_wrap .delivery_info_wp table .new input').off('click').on('click',function(){
    			$('#order .delivery_btn.user').prop('checked',false);
    			$('#order .delivery_btn.new').prop('checked',true);
    		});
    		
    		$('#order .user_info_wrap .search_zip').off('click').on('click',function(){
    			$("#order .user_info_wrap .order_zip").val('');
				$("#order .user_info_wrap .order_addr1").val('');
				$("#order .user_info_wrap .order_addr2").val('');
    			new daum.Postcode({
    				oncomplete : function(data){
						console.log("test::",data);
    					$("#order .user_info_wrap .order_zip").val(data.zonecode);
    					$("#order .user_info_wrap .order_addr1").val(data.roadAddress);
    				}
    			}).open();
    		});
    		
    		$('#order .delivery_info_wrap .search_zip').off('click').on('click',function(){
    			$("#order .delivery_info_wrap .order_zip").val('');
				$("#order .delivery_info_wrap .order_addr1").val('');
				$("#order .delivery_info_wrap .order_addr2").val('');
    			new daum.Postcode({
    				oncomplete : function(data){
    					$("#order .delivery_info_wrap .order_zip").val(data.zonecode);
    					$("#order .delivery_info_wrap .order_addr1").val(data.roadAddress);
    				}
    			}).open();
    		});
    		
			$('#order .buy_btn').off('click').on('click',function(){
				if(!$('#order .delivery_info_wrap .delivery_info_wp .order_name').val()){
					alert("배송지 정보를 입력해주세요.");
					return;
				}
    			var orderData = {};
    			orderData['goodsCnt'] = totalCnt;
    			orderData['goodsName'] = goodsName;
    			orderData['price'] = totalPrice;
    			orderData['buyerName'] = $('#order .delivery_info_wrap .delivery_info_wp .order_name').val();
    			orderData['buyerTel'] = $('#order .delivery_info_wrap .delivery_info_wp .order_phone').val();
    			orderData['buyerEmail'] = $('#order .delivery_info_wrap .delivery_info_wp .order_email').val();
    			orderData['recv_addr1'] = $('#order .delivery_info_wrap .delivery_info_wp .order_addr1').val();
    			orderData['recv_addr2'] = $('#order .delivery_info_wrap .delivery_info_wp .order_addr2').val();
    			orderData['recv_zipcode'] = $('#order .delivery_info_wrap .delivery_info_wp .order_zip').val();
    			orderData['moid'] = moid+nowDate();
    			
    			$.ajax({
    				url : base_url + "nicepay/setPayRequest.json",
    				data : orderData,
    				type : "POST",
    				success : function(data){
//     					console.log("::buy success::",data);
    					if(data.result == true){
    						window.open("${pageContext.request.contextPath}/nicepay/payRequest","width=500,height=700");
    					}
    				},
    				error : function(err){
    					console.log("error");
    					console.log(err);
    				}
    			});
    		});
    	}
    </script>
    
<jsp:include page='/include/footer'  flush="false" />