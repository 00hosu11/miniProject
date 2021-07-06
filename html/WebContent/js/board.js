$('#boardwriteBtn').click(function(){
	$('#subjectDiv').empty();
	$('#contentDiv').empty();
	
	if($('input[name=subject]').val() == ''){
		$('#subjectDiv').html("제목 입력");
		$('#subjectDiv').css('color', 'red');
		$('#subjectDiv').css('font-size', '8pt');
		$('#subjectDiv').css('font-weight', 'bold');
	}else if($('#content').val() == ''){
		$('#contentDiv').html("내용 입력");
		$('#contentDiv').css('color', 'red');
		$('#contentDiv').css('font-size', '8pt');
		$('#contentDiv').css('font-weight', 'bold');
	}else{
		$('form[name=boardWriteForm]').submit();
	}
});


    