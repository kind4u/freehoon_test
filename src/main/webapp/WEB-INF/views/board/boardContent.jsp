<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ include file="/WEB-INF/views/layout/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>board</title>
<script>
	// ������� �̵� �̺�Ʈ ó��
	$(document).on('click','#btnList',function()	{
		location.href = "${pageContext.request.contextPath}/board/getBoardList";
	});
	
	// ���� ��ư Ŭ�� �̺�Ʈ
	$(document).on('click','#btnUpdate',function()	{
		var url = "${pageContext.request.contextPath}/board/editForm";
		url = url + "?bid="+${boardContent.bid};
		url = url + "&mode=edit";
		
		location.href = url;
	});
	
	// ���� ��ư Ŭ�� �̺�Ʈ
	$(document).on('click','#btnDelete',function()	{
		var url = "${pageContext.request.contextPath}/board/deleteBoard";
		url = url + "?bid=" + ${boardContent.bid};
		location.href=url;
	});
</script>

</head>
<body>
	<article>
		<div class="container" role="main">
			<h2>board Content</h2>
			
			<div class="bg-white rounded shadow-sm">
				<div class="board_title"><c:out value="${boardCOntent.title}"/></div>
				<div class="board_info_box">
					<span class="board_author"><c:out value="${boardContent.reg_id}"/></span>
					<span class="board_date"><c:out value="${boardContent.reg_dt }"/></span>
				</div>
				<div class="board_content">${boardContent.content }</div>
				<div class="board_tag">TAG : <c:out value="${boardContent.tag}"/></div>
			</div>
			
			<div style="margin-top : 20px">
				<button type="button" class="btn btn-sm btn-primary" id="btnUpdate">����</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnDelete">����</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">���</button>
			</div>
		</div>
	</article>
</body>
</html>