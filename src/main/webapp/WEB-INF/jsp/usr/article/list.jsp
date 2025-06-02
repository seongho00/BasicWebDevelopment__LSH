<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.tailwindcss.com"></script>
<meta charset="UTF-8">
<title>FAQ</title>
</head>


<body class="bg-gray-50 p-6">


	<div class="max-w-3xl mx-auto">
		<h1 class="text-3xl font-bold mb-6">자주 묻는 질문 (FAQ)</h1> <!-- FAQ 항목 -->
		<form action="list">
			<input class="searchKeyword text-xl" type="text" name="searchKeyword"
				placeholder="검색어 입력" value="${param.searchKeyword }"
				autocomplete="off" />
			<button>검색</button>
		</form>
		<div class="space-y-4"><c:forEach var="faq" items="${FAQ }">

				<div
					class="group border-2 border-blue-500 rounded-xl bg-white shadow-lg hover:bg-blue-50 transition">
					<button
						class="faq-question w-full text-left px-6 py-4 text-xl font-semibold text-blue-800 group-hover:text-blue-900"
						onclick="toggleFaq(this)">${faq.id}. Q. ${faq.title }</button>

					<div class="faq-answer hidden  px-6 pb-6 text-lg text-gray-700">A.
						${faq.body }</div>
				</div>
			</c:forEach></div>

	</div>

	<script>
		$(document).ready(function() {
			$('.faq-question').on('click', function() {
				const $answer = $(this).next('.faq-answer');

				// 현재 항목 토글
				$answer.slideToggle(200);
				$icon.text($answer.is(':visible') ? '+' : '×'); // × 는 열려있는 상태로 표시
			});
		});
	</script>

</body>
</html>