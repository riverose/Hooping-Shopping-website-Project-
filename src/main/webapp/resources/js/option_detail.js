$(function(){
	$('#colorselectbox').change(function(){
		if($(this).val()!="컬러"){
			$.ajax({
				type:'post',
				url : 'colorCheck.do',
				data : {'optionsColor':$(this).val(), 'productId':$('#getproductid').text()},
				async : true, // submit이 진행이 안되도록 하는 비동기 통신 옵션
				contentType : 'application/x-www-form-urlencoded;charset=UTF-8', 
				success : function(resultData){
					var size=resultData.split(',');
					var inner=document.getElementById('sizeselectbox');
					inner.innerHTML='';
					inner.innerHTML+='<option value="사이즈">사이즈</option>'
					for(i=0; i<size.length; i++){
						inner.innerHTML+='<option class="size_choice" value="'+size[i]+'">'+size[i]+'</option>';
					}
				} // success시 함수
			});//ajax 닫기
		}// if문닫기
		else{
			var inner=document.getElementById('sizeselectbox');
			inner.innerHTML='';
			inner.innerHTML+='<option value="사이즈">사이즈</option>'
			
		}
	}); // 셀렉박스 체인지 끝
}); // 전체 괄호 닫기