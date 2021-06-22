$(document).ready(function() {
	let date = [];
	//날짜별로 묶기
	$.each($("#newalarms").find("th"), function(index, item) {

		date.push($(this).text());

		if (index != 0 && date[index] == date[index - 1]) {

			$(this).parent().parent().remove();
		}

	})

	let date2 = [];
	//날짜별로 묶기
	$.each($("#oldalarms").find("th"), function(index, item) {

		date2.push($(this).text());

		if (index != 0 && date2[index] == date2[index - 1]) {

			$(this).parent().parent().remove();
		}

	})

	/*	//알림들에 링크 걸기
		$.each($("#newalarms").children().find("td"), function(index,item){
			
			let text = $(this).text();
			let code = $(this).attr("class");
			$(this).empty();
			
			if(code == "PR_IN" || code == "PR_S" || code == "PR_F" || code == "PR_UP"){
					
				//프로젝트에 초대됨, 참여 승인됨, 거절됨, 프로젝트 상태 바뀜
				$(this).append('<a href="/project/detail?project_id='+$(this).attr("id")+'">'+text+'</a>');
				
			} else if($(this).attr("class") == "PR_A"){
				
				//내 프로젝트에 누가 지원함
				$(this).append('<a href="/member/detail?member_id='+$(this).attr("id")+'">'+text+'</a>');
				
			} else if($(this).attr("class") == "MY_RV"){
				//누가 내게 리뷰를 남김
				$(this).append('<a href="/project/detail?project_id='+$(this).attr("id")+'">'+text+'</a>');
				
			} else if($(this).attr("class") == "QNAR"){
				//내 질문에 답변이 달림
				$(this).append('<a href="/project/detail?project_id='+$(this).attr("id")+'">'+text+'</a>');
			}
			
		});*/


	//새 알림 클릭해서 이동하면 상태 확인으로 업데이트 하기
	$("#newalarms").children().find("a").on("click", function() {
		console.log($(this).parent().parent().attr("id"));
		//console.log($(this).parent().attr("id"))
		$.ajax({

			url: "/alarm/checkalarm",
			data: { alarm_id: $(this).parent().parent().attr("id") },
			dataType: "text",
			type: "post",
			success: function(res) {
				console.log(res);
			},
			error: function(xhr) {
				console.log(xhr);
			}

		});

	});

	//지난 알림 클릭해서 지우기
	$("#oldalarms").children().find("td").on("click", function() {

		let td = $(this)
		let body = td.parent().parent();

		//console.log($(this).parent().attr("id"))
		$.ajax({

			url: "/alarm/deletealarm",
			data: { alarm_id: $(this).parent().attr("id") },
			dataType: "text",
			type: "post",
			success: function(res) {
				console.log(res);
				if (res == "true") {

					console.log(body);
					console.log(body.next())
					if (body.next().attr("class") == "apply_table_sec" || body.prev().attr("class") == "apply_table_sec") {
						body.remove();
						console.log("하나 아님")
					} else {
						console.log("하나")
						body.prev().remove();
						body.remove();
					}
					swal("알림내역이 삭제되었습니다", "", "success");
				}

			},
			error: function(xhr) {
				console.log(xhr);
			}

		});

	});



});//document ready 끝


function addNewAlarm(message) {
	console.log(message);
	swal("새 알림이 도착했습니다","","info");
	setTimeout("location.reload()", 15000)

	
/*
	//날짜 얻기
	var now = new Date();
	var year = now.getFullYear();
	var month = now.getMonth() + 1;    //1월이 0으로 되기때문에 +1을 함.
	var date = now.getDate()

	var today = year + "-" + month + "-" + date
	console.log(today)
	$.each($("#newalarms").find("thead"), function() {
		
		if($(this).find("tr").text() == today){
			
			if(code == "PR_IN" || code == "PR_S" || code == "PR_F" || code == "PR_UP"){
					
				//프로젝트에 초대됨, 참여 승인됨, 거절됨, 프로젝트 상태 바뀜
				$(this).after(
					'<tbody class="apply_table_sec"><tr id=""><td>'
					+'<a href="/project/detail?project_id='+$(this).attr("id")+'">'+text+'</a></td></tr></tbody>'
					);
				
			} else if($(this).attr("class") == "PR_A"){
				
				//내 프로젝트에 누가 지원함
				$(this).append('<a href="/member/detail?member_id='+$(this).attr("id")+'">'+text+'</a>');
				
			} else if($(this).attr("class") == "MY_RV"){
				//누가 내게 리뷰를 남김
				$(this).append('<a href="/project/detail?project_id='+$(this).attr("id")+'">'+text+'</a>');
				
			} else if($(this).attr("class") == "QNAR"){
				//내 질문에 답변이 달림
				$(this).append('<a href="/project/detail?project_id='+$(this).attr("id")+'">'+text+'</a>');
			}
			
		}
		

	})*/


}

