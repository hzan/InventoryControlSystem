<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tags-conf/struts-bean.tld" prefix="bean"%>
<%@taglib uri="/WEB-INF/tags-conf/struts-logic.tld" prefix="logic"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="js/dhtmlx/sources/dhtmlxCommon/codebase/dhtmlxcommon.js"></script>
<script type="text/javascript"
	src="js/dhtmlx/sources/dhtmlxCommon/codebase/dhtmlxcontainer.js"></script>

<script type="text/javascript"
	src="js/dhtmlx/sources/dhtmlxLayout/codebase/dhtmlxlayout.js"></script>
<link rel="stylesheet" type="text/css"
	href="js/dhtmlx/sources/dhtmlxLayout/codebase/skins/dhtmlxlayout_dhx_web.css" />

<style type="text/css">
div#headerDiv {
	position: relative;
	margin-top: 20px;
	margin-left: 20px;
	width: 1000px;
	height: 100px;
	display: block;
	font-family: sans-serif;
	color: #555753;
	margin-left: auto;
	margin-right: auto;
/* 	background-color: #0062F5; */
	padding: 0px;
}

h1{
	padding-bottom: 2px; 
}

h2{
	padding-bottom: 2px; 
}

</style>

<script>
	
</script>

</head>
<body>
	<div id="headerDiv">
		<h2>Instituto tecnologico de Huaichinango, Pue.</h2>
		<h3>Sistema para el control de inventarios.</h3>
		<logic:present name="user">
			<h4 align="right">
				Bienvenido
				<bean:write name="user" property="name" />
			</h4>
		</logic:present>
	</div>
</body>
</html>