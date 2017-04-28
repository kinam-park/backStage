<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page='/include/header'  flush="false" />

    <!-- html -->
	<div id="cart" class="cart_component">
		<div style="height:40px;"></div>
		<div class="w1200">
			<div class="title bold">ORDER</div>
			<div style="height:20px;"></div>
			<div class="cart_area">
				<div class="cart_wrap">
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
									<div class="total_price fr"></div>
									<div class="fr">[합계] : </div>
									<div class="fr">=</div>
									<div class="delivery_price fr" price="3000"> 3,000원</div>
									<div class="fr">[배송비]</div>
									<div class="fr">+</div>
									<div class="order_price fr"></div>
									<div class="fr">[상품구매금액]</div>
									<div class="clear"></div>
								</td>
							</tr>						
						</tfoot>
					</table>
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
//     		cartListener();
    	});
    	
    	function getCartList(){
    		$.ajax({
				url : base_url + "cart/getCartList.json",
				type : "POST",
				success : function(data){
					console.log("::getCartList::",data);
					drawCartList(data.result);
				},
				error : function(err){
					console.log("error");
					console.log(err);
				}
			});
    	}
    	
    	function drawCartList(data){
    		$('#cart .cart_area .cart_wrap table tbody').empty();
    		var totalPrice=0; 
    		for(var i=0; i<data.length; i++){
    			var html = tempCartList(data[i]);
    			$('#cart .cart_area .cart_wrap table tbody').append(html);
    			totalPrice += data[i].price*1*data[i].stock*1;
    		}
    		$('#cart .order_price').html(splitNum(totalPrice)+"원");
    		console.log($('#cart .delivery_price').html().split("원"));
    		$('#cart .total_price').html( splitNum(totalPrice+$('#cart .delivery_price').attr('price')*1) +"원");
    		cartListener();
    	}
    	
    	function tempCartList(data){
    		var html = '';
			html += '<tr cart_id="'+data.cart_id+'" shop_id="'+data.shop_id+'">';
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
				url : base_url + "cart/deleteCart.json",
				type : "POST",
				data : {cart_id:code},
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
				url : base_url + "cart/updateCart.json",
				type : "POST",
				data : {cart_id:params.cartId,shop_id:params.shopId,stock:params.stock},
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
    	
    	function cartListener(){
    		$('#cart .delete_btn').off('click').on('click',function(){
    			var code = $(this).parent().parent().attr("cart_id");
    			deleteCartItem(code);
    		});
    		
    		$('#cart .update_btn').off('click').on('click',function(){
    			var params = {};
    			params.cartId = $(this).parent().parent().attr("cart_id");
    			params.shopId = $(this).parent().parent().attr("shop_id");
    			params.stock = $("#cart .update_btn").parent().siblings(".qty").find("input").val()*1;
    			updateCartItem(params);
    		});
    		
			$('#cart .buy_btn').off('click').on('click',function(){
    			var cartId = '';
    			var cartList = $('#cart table tbody').find('tr');
//     			console.log(cartList[0].attributes[0].nodeValue);
    			for(var i=0; i<cartList.length; i++){
    				if(i == 0){
	    				cartId += cartList[i].attributes[0].nodeValue;
    				}else{
    					cartId += "," + cartList[i].attributes[0].nodeValue;
    				}
    			}
    			sessionStorage.setItem("cartInfo",cartId);
    			location.href = "orderPage";
    		});
    	}
    </script>
    
<jsp:include page='/include/footer'  flush="false" />