//중복 아이디 체크
$('#id').focusout(function(){
	if($('#id').val() == ''){
		$('#idDiv').html("먼저 아이디 입력");
		$('#idDiv').css('color', 'magenta');
		$('#idDiv').css('font-size', '8pt');
		$('#idDiv').css('font-weight', 'bold');
	}else{
		$.ajax({
			url: '/jQueryProject/member/checkId.jsp',
			type: 'post',
			data: 'id='+$('#id').val(),
			dataType: 'text',
			success: function(data){
				data = data.trim();
				
				if(data == 'exist'){
					$('#idDiv').text('사용 불가능')
					$('#idDiv').css('color','magenta')
					$('#idDiv').css('font-size','8pt')
					$('#idDiv').css('font-weight','bold');
				}else if(data == 'non_exist'){
					$('#check').val($('#id').val());
				
					$('#idDiv').text('사용 가능')
					$('#idDiv').css('color','blue')
					$('#idDiv').css('font-size','8pt')
					$('#idDiv').css('font-weight','bold');
				}
			},
			error: function(err){
				console.log(err);
			}
		});
	}
});

//우편번호
$('#checkPostBtn').click(function(){
	window.open("/jQueryProject/member/checkPost.jsp", "checkPost", "width=500 height=500 left=800 top=200 scrollbars=yes");
});

//회원가입
$('#writeBtn').click(function(){
	$('#nameDiv').empty();
	$('#idDiv').empty();
	$('#pwdDiv').empty();
	
	if($('input[name=name]').val() == ''){
		$('#nameDiv').html("이름 입력");
		$('#nameDiv').css('color', 'red');
		$('#nameDiv').css('font-size', '8pt');
		$('#nameDiv').css('font-weight', 'bold');
	}else if($('input[name=id]').val() == ''){
		$('#idDiv').html("아이디 입력");
		$('#idDiv').css('color', 'red');
		$('#idDiv').css('font-size', '8pt');
		$('#idDiv').css('font-weight', 'bold');
	}else if($('input[name=pwd]').val() == ''){
		$('#pwdDiv').html("비밀번호 입력");
		$('#pwdDiv').css('color', 'red');
		$('#pwdDiv').css('font-size', '8pt');
		$('#pwdDiv').css('font-weight', 'bold');
	}else if($('input[name=pwd]').val() != $('input[name=repwd]').val()){
		$('#pwdDiv').html("비밀번호가 일치하지 않습니다");
		$('#pwdDiv').css('color', 'red');
		$('#pwdDiv').css('font-size', '8pt');
		$('#pwdDiv').css('font-weight', 'bold');
	}
	else if($('input[name=id]').val() != $('input[name=check]').val()){
		$('#idDiv').html("중복체크 하세요");
		$('#idDiv').css('color', 'red');
		$('#idDiv').css('font-size', '8pt');
		$('#idDiv').css('font-weight', 'bold');
	}else{
		$('form[name=writeForm]').submit();
	}
});


    