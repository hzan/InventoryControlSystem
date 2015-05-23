<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tags-conf/struts-html.tld" prefix="html"%>
<%@taglib uri="/WEB-INF/tags-conf/struts-logic.tld" prefix="logic"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sistema de control de Inventarios</title>

<!-- <script type="text/javascript" src="js/dhtmlx/codebase/dhtmlx.js"></script> -->
<!-- <link rel="stylesheet" type="text/css" -->
<!-- 	href="js/dhtmlx/skins/web/dhtmlx.css" /> -->

<script type="text/javascript"
	src="js/dhtmlx/sources/dhtmlxCommon/codebase/dhtmlxcommon.js"></script>
<script type="text/javascript"
	src="js/dhtmlx/sources/dhtmlxCommon/codebase/dhtmlxcontainer.js"></script>

<script type="text/javascript"
	src="js/dhtmlx/sources/dhtmlxForm/codebase/dhtmlxform.js"></script>
<link rel="stylesheet" type="text/css"
	href="js/dhtmlx/sources/dhtmlxForm/codebase/skins/dhtmlxform_dhx_web.css" />

<script type="text/javascript"
	src="js/dhtmlx/sources/dhtmlxWindows/codebase/dhtmlxwindows.js"></script>
<link rel="stylesheet" type="text/css"
	href="js/dhtmlx/sources/dhtmlxWindows/codebase/skins/dhtmlxwindows_dhx_web.css" />

<script>
	var login_form;
	var dhxWins;
	function doOnLoad() {
		dhxWins = new dhtmlXWindows();
		var login_window = dhxWins
				.createWindow("loginWindow", 0, 100, 400, 280);
		login_window.setText("Sistema de Control de Inventarios");
		// 		login_window.centerOnScreen();
		login_window.setModal(true);
		login_window.button('park').hide();
		login_window.button('minmax').hide();
		login_window.button('close').hide();

		login_form = login_window.attachForm();
		login_form.loadStruct("xml/login_form.xml");

		login_form.attachEvent("onButtonClick", function(id) {
			if (id == "login") {
				document.getElementById("username").value = login_form
						.getItemValue("username");
				document.getElementById("password").value = login_form
						.getItemValue("password");
				alert("Set " + document.getElementById("username").value
						+ document.getElementById("password").value);
				login_form_hidden.submit();
			}
		});
	}
</script>
<style>
body {
	background-color: #003748;
}
</style>
</head>
<body onload="doOnLoad();">
	<form action="j_acegi_security_check" method="post"
		name="login_form_hidden">
		<input name="username" type="hidden" id="username" /> <input
			name="password" type="hidden" id="password" />
	</form>
</body>
</html>