<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<meta charset="UTF-8">
<title>ARTICLE LIST</title>

</head>
<body>

	<script>
		function enableEdit() {
			const title = $('#titleText').text();
			const body = $('#bodyText').text();
			$('.modifyButton').hide();

	
			$('#titleCell').html(`<input type="text" id="titleInput" value="${title}" style="width: 90%;">`);
			$('#bodyCell').html(`<textarea id="bodyInput" rows="5" style="width: 90%;">${body}</textarea>`);
	
			// 저장 버튼 추가
			if ($('#saveBtn').length === 0) {
				$('.btns').append(`
					<button class="btn btn-outline" id="saveBtn" onclick="submitEdit(${article.id});">저장</button>
				`);
			}
		}
		function submitEdit(articleId) {
			const newTitle = $('#titleInput').val();
			const newBody = $('#bodyInput').val();

			$.ajax({
				url : 'doModify',
				type : 'POST',
				data : {
					id : articleId,
					title : newTitle,
					body : newBody
				},
				success : function(response) {
					alert('수정이 완료되었습니다.');
					location.reload(); // 새로고침으로 변경 반영
				},
				error : function(xhr) {
					alert('수정 실패: ' + xhr.responseText);
				}
			});
		}
	</script>

	<h1>ARTICLE DETAIL</h1>
	<p>사용자 : 임성호</p>

	<section class="mt-24 text-xl px-4">
		<div class="mx-auto">
			<table class="table" border="1" cellspacing="0" cellpadding="5"
			style="width: 100%; border-collapse: collapse;">
				<tbody>
					<tr>
						<th style="text-align: center;">ID</th>
						<td style="text-align: center;">${article.id}</td>
					</tr>
					<tr>
						<th style="text-align: center;">Registration Date</th>
						<td style="text-align: center;">${article.regDate}</td>
					</tr>
					<tr>
						<th style="text-align: center;">Update Date</th>
						<td style="text-align: center;">${article.updateDate}</td>
					</tr>
					<tr>
						<th style="text-align: center;">Writer</th>
						<td style="text-align: center;">${article.writer }</td>
					</tr>

					<tr>
						<th style="text-align: center;">Title</th>
						<td style="text-align: center;" id="titleCell">
							<span id="titleText">${article.title}</span>
						</td>
					</tr>
					<tr>
						<th style="text-align: center;">Body</th>
						<td style="text-align: center;" id="bodyCell">
							<span id="bodyText">${article.body}</span>
						</td>
					</tr>
				</tbody>
		</table>
			<div class="btns">
				<button class="btn btn-ghost" type="button"
					onclick="location.replace('list');">리스트로 가기</button> <a
					onclick="return confirm('정말로 삭제하시겠습니까?');" class="btn btn-ghost"
					href="../article/doDelete?id=${article.id}">삭제</a>
				<button class="modifyButton btn btn-ghost" type="button"
					onclick="enableEdit();">수정</button>


		</div>

	</div>
	</section>

</body>
</html>