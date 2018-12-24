<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>TODO List</title>
<style>
#todoTable, #doingTable, #doneTable{
	width: 33%;
	height: 100%;
	display: inline-block;
	vertical-align: top;
}
</style>
</head>
<body>
	<div class="container">
		<h1>TODO LIST</h1>
		<div>
			<div>
				<label for="todo_title">제목</label> 
				<input type="text" id="todo_title" name="todo_title" required/>
				<label for="todo_content">내용</label>
				<input type="text" id="todo_content" name="todo_content" required/> 
			</div>
			<div>
				<label>우선순위</label>
				<input type="radio" name="todo_rank" id="rank1" value="1" required><label for="rank1">1순위</label>
				<input type="radio" name="todo_rank" id="rank2" value="2" required><label for="rank2">2순위</label>
				<input type="radio"	name="todo_rank" id="rank3" value="3" required><label for="rank3">3순위</label>
			</div>
			<div>
				<label for="todo_deadline">마감기한</label>
				<input type="text" id="todo_deadline" name="todo_deadline" readonly required/>
				<button id="newTodoRegBtn" class="btn btn-dark">등록</button>
			</div>
		</div>
		<div id="wholeTable">
			<table id="todoTable" class="table table-striped table-bordered">
				<thead>
					<tr>
						<th style="width: 366.29px; border: 0px">시작전</th>
					</tr>
				</thead>
				<tbody id="todoTableBody">
				</tbody>
			</table>
			<table id="doingTable" class="table table-striped table-bordered">
				<thead>
					<tr>
						<th style="width: 366.29px; border: 0px">진행중</th>
					</tr>
				</thead>
				<tbody id="doingTableBody">
				</tbody>
			</table>
			<table id="doneTable" class="table table-striped table-bordered">
				<thead class="thead">
					<tr>
						<th style="width: 366.29px; border: 0px">완료</th>
					</tr>
				</thead>
				<tbody id="doneTableBody">
				</tbody>
			</table>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="todoUpdateModal" tabindex="-1" role="dialog" aria-labelledby="todoUpdateModalLabel" aria-hidden="true">
	  <input type="hidden" id="todo_idx_modal">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="todoUpdateModalLabel">수정하기</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form>
	          <div class="form-group">
	            <label for="todo_title_modal" class="col-form-label">제목</label>
	            <input type="text" class="form-control" id="todo_title_modal" required>
	          </div>
	          <div class="form-group">
	            <label for="todo_content_modal" class="col-form-label">내용</label>
	            <input type="text" class="form-control" id="todo_content_modal" required>
	          </div>
	          <div class="form-group">
	            <label for="todo_rank_modal" class="col-form-label">우선순위</label>
	            <input type="radio" name="todo_rank_modal" id="todo_rank1" value="1" required><label for="todo_rank1">1순위</label>
				<input type="radio" name="todo_rank_modal" id="todo_rank2" value="2" required><label for="todo_rank2">2순위</label>
				<input type="radio"	name="todo_rank_modal" id="todo_rank3" value="3" required><label for="todo_rank3">3순위</label>
	          </div>
	          <div class="form-group">
	            <label for="todo_deadline_modal" class="col-form-label">마감기한</label>
	            <input type="text" id="todo_deadline_modal" name="todo_deadline_modal" readonly required/>
	          </div>
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="todoUpdate()">수정</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	      </div>
	    </div>
	  </div>
	</div>
</body>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/datepicker/datepicker-ko.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		getTodoList();
	});
	
	var list = '';
	var list2 = '';
	var list3 = '';
	
	//todo 전체 출력
	function getTodoList() {
		$.ajax({
			type : 'get',
			url : '${pageContext.request.contextPath}/todo',
			success : function(data) {
				$(data).each(function(index, item) {
						//시작전 테이블
						if (item.todo_check == "0") {
							list += '<tr>';
							list += '<td>' 
									+ '<div id="todo_title">제목 : ' + item.todo_title + '</div>'
									+ '<div id="todo_content">내용 : ' + item.todo_content + '</div>' 
									+ '<div id="todo_rank">우선순위 : ' + item.todo_rank + '</div>'
									+ '<div id="todo_date">작성날짜 : ' + item.todo_date + '</div>'
									+ '<div id="todo_deadline">마감기간 : ' + item.todo_deadline + '</div>'
									+ '<button id="todoOutputModalBtn' + item.todo_idx + '" class="btn btn-info" onclick="todoOutputModal(' + item.todo_idx + ')" data-toggle="modal" data-target="#todoUpdateModal">수정</button>'
									+ '<button id="todoDeleteBtn' + item.todo_idx + '" class="btn btn-danger" onclick="todoDelete(' + item.todo_idx + ')">삭제</button>'
									+ '<button id="todoMoveBtn' + item.todo_idx + '" class="btn btn-secondary" onclick="todoMove(' + item.todo_idx + ')">진행</button>'
									+ '</td>';
							list += '</tr>';
						}
						//진행중 테이블
						if (item.todo_check == "1") {
							list2 += '<tr>';
							list2 += '<td>' 
									+ '<div id="todo_title">제목 : ' + item.todo_title + '</div>'
									+ '<div id="todo_content">내용 : ' + item.todo_content + '</div>' 
									+ '<div id="todo_rank">우선순위 : ' + item.todo_rank + '</div>'
									+ '<div id="todo_date">작성날짜 : ' + item.todo_date + '</div>'
									+ '<div id="todo_deadline">마감기간 : ' + item.todo_deadline + '</div>'
									+ '<button id="todoOutputModalBtn' + item.todo_idx + '" class="btn btn-info" onclick="todoOutputModal(' + item.todo_idx + ')" data-toggle="modal" data-target="#todoUpdateModal">수정</button>'
									+ '<button id="todoDeleteBtn' + item.todo_idx + '" class="btn btn-danger" onclick="todoDelete(' + item.todo_idx + ')">삭제</button>'
									+ '<button id="todoMoveBtn' + item.todo_idx + '" class="btn btn-secondary" onclick="todoMove(' + item.todo_idx + ')">완료</button>'
									+ '</td>';
							list2 += '</tr>';
							
						}
						//완료 테이블
						if (item.todo_check == "2") {
							list3 += '<tr>';
							list3 += '<td>' 
									+ '<div id="todo_title">제목 : ' + item.todo_title + '</div>'
									+ '<div id="todo_content">내용 : ' + item.todo_content + '</div>' 
									+ '<div id="todo_rank">우선순위 : ' + item.todo_rank + '</div>'
									+ '<div id="todo_date">작성날짜 : ' + item.todo_date + '</div>'
									+ '<div id="todo_deadline">마감기간 : ' + item.todo_deadline + '</div>'
									+ '<button id="todoOutputModalBtn' + item.todo_idx + '" class="btn btn-info" onclick="todoOutputModal(' + item.todo_idx + ')" data-toggle="modal" data-target="#todoUpdateModal">수정</button>'
									+ '<button id="todoDeleteBtn' + item.todo_idx + '" class="btn btn-danger" onclick="todoDelete(' + item.todo_idx + ')">삭제</button>'
									+ '</td>';
							list3 += '</tr>';
						}
					});
				$('#todoTableBody').html(list);
				$('#doingTableBody').html(list2);
				$('#doneTableBody').html(list3);
				list = '';
				list2 = '';
				list3 = '';
			}
		});
	};

	//todo 등록
	$('#newTodoRegBtn').click(function() {
		var todo_title = $('#todo_title').val(); //할일 제목
		var todo_content = $('#todo_content').val(); //할일 내용
		var todo_rank = $(':input:radio[name=todo_rank]:checked').val(); //할일 우선순위
		var todo_deadline = $('#todo_deadline').val(); //할일 마감기한

		if(todo_title && todo_content && todo_rank && todo_deadline){
			$.ajax({
				type : 'post',
				url : '${pageContext.request.contextPath}/todo',
				data : {
					todo_title : todo_title,
					todo_content : todo_content,
					todo_rank : todo_rank,
					todo_deadline : todo_deadline
				},
				success : function(data) {
					if(data == 0){
						console.log('등록 실패');
					} else {
						console.log('등록 성공');
						getTodoList();
						//등록 후 초기화
						$('#todo_title').val('');
						$('#todo_content').val('');
						$(':input:radio[name=todo_rank]:checked').prop("checked", false);
						$('#todo_deadline').val('');
					}
				}
			});
		} else {
			//모든 input을 입력 안하면
			console.log('모두 입력 안함');
			alert('모두 입력해주세요!');
		}
	});

	//todo 삭제
	function todoDelete(todo_idx) {
		if (confirm('정말 삭제하시나요?') == true) {
			$.ajax({
				type : 'delete',
				url : '${pageContext.request.contextPath}/todo/' + todo_idx,
				success : function(data) {
					if(data == 0){
						console.log('삭제 실패');
					} else {
						console.log('삭제 성공');
						getTodoList();
					}
				}
			});
		}
	};
	
	//todo 선택 출력
	function todoOutputModal(todo_idx){
		$.ajax({
			type : 'get',
			url : '${pageContext.request.contextPath}/todo/' + todo_idx,
			success : function(data){
				$(data).each(function(index, item) {
					$('#todo_idx_modal').val(item.todo_idx);
					$('#todo_title_modal').val(item.todo_title);
					$('#todo_content_modal').val(item.todo_content);
					$(':input:radio[name=todo_rank_modal]').filter('[value="'+ item.todo_rank + '"]').prop("checked", true);
					$('#todo_deadline_modal').val(item.todo_deadline);
				});
			}
		});
	};
	
	//todo 수정
	function todoUpdate() {
		var todo_idx_modal = $('#todo_idx_modal').val();
		var todo_title_modal = $('#todo_title_modal').val();
		var todo_content_modal = $('#todo_content_modal').val();
		var todo_rank_modal = $('input[name="todo_rank_modal"]:checked').val();
		var todo_deadline_modal = $('#todo_deadline_modal').val();

		$.ajax({
			type : 'put',
			url : '${pageContext.request.contextPath}/todo/' + todo_idx_modal,
			headers : {
				"Content-Type" : "application/json",
			},
			data : JSON.stringify({
				todo_idx : todo_idx_modal,
				todo_title : todo_title_modal,
				todo_content : todo_content_modal,
				todo_rank : todo_rank_modal,
				todo_deadline : todo_deadline_modal
			}),
			success : function(data){
				if (data == 0) {
					console.log('수정 실패');
				} else {
					console.log('수정 성공');
					getTodoList();
				}
			}
		});
	};

	//todo 이동
	function todoMove(todo_idx) {
		$.ajax({
			type : 'patch',
			url : '${pageContext.request.contextPath}/todo/' + todo_idx,
			success : function(data) {
				if (data == 0) {
					console.log('이동 실패');
				} else {
					console.log('이동 성공');
					getTodoList();
				}
			}
		});
	};
	
	//마감기한 달력 위젯
	$(function() {
		$("#todo_deadline").datepicker();
		$("#todo_deadline_modal").datepicker();
	});
</script>
</html>