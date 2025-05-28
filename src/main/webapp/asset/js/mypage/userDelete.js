/**
 * 
 */
function userDeleteClick(){
	let obj = new Object();
		obj.userIdx = sessionUserIdx;

		$.ajax({
			url: contextPath + '/userDelete.mew',
			type: 'post',
			data: obj,
			dataType: 'json', //성공 유무
			success: function(res) { // 성공 했을 때
				console.log(res);
				if (res.code == 200) {
					alert('삭제완료');
					location.href = contextPath + "/main.me";
				} else {
					alert(res.msg);
				}
				// location.href = , 보내고 싶은 페이지 이동 
			}
		})
}