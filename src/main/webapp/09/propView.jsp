<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.property-name:hover{
		cursor:pointer;
		background-color:silver;
		margin-right:10px;
	}
	.property-value{
		margin-left : 10px;
		color: lime;
	}
/*
	.property-name{
	margin-right:10px;
	}
 	.value-name{
	color:red;
	}
*/

</style>
</head>
<body data-context-path="<%=request.getContextPath() %>">
<!-- 
	1.
	2. DOhost
	3. 
	4.
 -->
<form method="POST" action="<%=request.getContextPath() %>/09/property">
	<input tyep="text" name="propertyName" placeholder="propertyName">
	<input tyep="text" name="propertyValue" placeholder="propertyValue">
	<button type="submit">신규등록</button>
</form>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/app/09/propView.js?<%=System.currentTimeMillis()%>"></script>
</body>
</html>