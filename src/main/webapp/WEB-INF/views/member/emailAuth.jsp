<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	<meta name="format-detection" content="telphone=no">	

	<title>Starbucks Coffee Korea</title>

	<link href="${pageContext.request.contextPath}/resources/images/common/favicon.ico" rel="shortcut icon" type="image/ico">
	<link href="${pageContext.request.contextPath}/resources/css/common/reset.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/css/common/header.css?v=1" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/css/common/footer.css?v=1" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/css/main.css?v=1" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/css/common/jquery.bxslider.css" rel="stylesheet">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common/jquery.bxslider.min.js"></script>
	<style type="text/css">
		#container { width:100%; padding:30px 0; }
		#container span { color:green; font-weight:bold; }
		#container div { padding:10px; }
		input[type="number"]::-webkit-outer-spin-button,
		input[type="number"]::-webkit-inner-spin-button {
		    -webkit-appearance: none;
		    margin: 0;
		}
		#authkey_txt { padding:10px 5px; width:100px; float:left; }
		#authKey { padding: 10px; }
	</style>
	<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>
</head>
<body>
<div id="wrap">
	<!-- Header -->
	<c:import url="../common/header.jsp"></c:import>
	<!-- //Header -->
	
	<div id="container">
		<span>입력한 이메일로 받은 인증번호를 입력하세요. (인증번호가 맞아야 다음 단계로 넘어가실 수 있습니다.)</span>
		<form action="./emailAuth" method="post">
			<div><p id="authkey_txt"> 인증번호 입력 : </p><input type="number" id="authKey" name="authKey" placeholder="인증번호를 입력하세요." /> </div>                                        
			<button type="submit" name="submit">인증번호 확인</button>
		</form>
	</div>

	<!-- Footer -->
	<c:import url="../common/footer.jsp"></c:import>
	<!-- //Footer -->
</div>
	<script src="${pageContext.request.contextPath}/resources/js/common/header.js?v=1"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common/footer.js?v=1"></script>
</body>
</html>