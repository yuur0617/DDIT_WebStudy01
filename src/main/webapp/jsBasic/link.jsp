<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<dl>
	<dt>자바스크립트와 jquery 를 이용한 비동기 요청</dt>
	<dd>
		<p>XMLHttpRequest, ajax, fetch</p>
		<p><a href="<%=request.getContextPath() %>/05/xhrGetDesc.html">단순 GET 요청</a></p>
		<p><a href="<%=request.getContextPath() %>/05/xhrGetDesc_QS.html">GET 요청 + QueryString 형태 파라미터</a></p>
		<p><a href="<%=request.getContextPath() %>/05/xhrPostDesc.html">POST 요청</a></p>
	</dd>
	<dt>DOM 트리 구조와 노드 access</dt>
	<dd>
		<p><a href="<%=request.getContextPath() %>/10/domAccess.html">트리의 계층구조와 노드간 관계</a></p>
	</dd>
	
</dl>
</body>
</html>