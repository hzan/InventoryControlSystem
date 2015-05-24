<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Sistema de control de Inventarios</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<script type="text/javascript" src="js/dhtmlx/sources/dhtmlxCommon/codebase/dhtmlxcommon.js"></script>
<script type="text/javascript" src="js/dhtmlx/sources/dhtmlxCommon/codebase/dhtmlxcontainer.js"></script>
	
<script type="text/javascript" src="js/dhtmlx/sources/dhtmlxLayout/codebase/dhtmlxlayout.js"></script>
<link rel="stylesheet" type="text/css"
	href="js/dhtmlx/sources/dhtmlxLayout/codebase/skins/dhtmlxlayout_dhx_web.css" />
	
<script type="text/javascript" src="js/dhtmlx/sources/dhtmlxMenu/codebase/dhtmlxmenu.js"></script>
<link rel="stylesheet" type="text/css"
	href="js/dhtmlx/sources/dhtmlxMenu/codebase/skins/dhtmlxmenu_dhx_web.css" />

<script type="text/javascript" src="js/dhtmlx/sources/dhtmlxTabbar/codebase/dhtmlxtabbar.js"></script>
<link rel="stylesheet" type="text/css"
	href="js/dhtmlx/sources/dhtmlxTabbar/codebase/skins/dhtmlxtabbar_dhx_web.css" />

<script type="text/javascript" src="js/dhtmlx/sources/dhtmlxToolbar/codebase/dhtmlxtoolbar.js"></script>
<link rel="stylesheet" type="text/css"
	href="js/dhtmlx/sources/dhtmlxToolbar/codebase/skins/dhtmlxtoolbar_dhx_web.css" />
	
<script type="text/javascript" src="js/dhtmlx/sources/dhtmlxGrid/codebase/dhtmlxgrid.js"></script>
<link rel="stylesheet" type="text/css"
	href="js/dhtmlx/sources/dhtmlxGrid/codebase/skins/dhtmlxgrid_dhx_web.css" />
	
<script type="text/javascript"
	src="js/dhtmlx/sources/dhtmlxForm/codebase/dhtmlxform.js"></script>
<link rel="stylesheet" type="text/css"
	href="js/dhtmlx/sources/dhtmlxForm/codebase/skins/dhtmlxform_dhx_web.css" />
	
<!-- <script type="text/javascript" -->
<!-- 	src="js/dhtmlx/sources/dhtmlxWindows/codebase/dhtmlxwindows.js"></script> -->
<!-- <link rel="stylesheet" type="text/css" -->
<!-- 	href="js/dhtmlx/sources/dhtmlxWindows/codebase/skins/dhtmlxwindows_dhx_web.css" /> -->
	
<!-- <script type="text/javascript" -->
<!-- 	src="js/dhtmlx/sources/dhtmlxCalendar/codebase/dhtmlxcalendar.js"></script> -->
<!-- <link rel="stylesheet" type="text/css" -->
<!-- 	href="js/dhtmlx/sources/dhtmlxCalendar/codebase/skins/dhtmlxcalendar_dhx_web.css" />	 -->

<script type="text/javascript"
	src="js/dhtmlx/sources/dhtmlxEditor/codebase/dhtmlxeditor.js"></script>
<link rel="stylesheet" type="text/css"
	href="js/dhtmlx/sources/dhtmlxEditor/codebase/skins/dhtmlxeditor_dhx_web.css" />
			
<style>
div#homeTabbar {
	position: relative;
	margin-top: 20px;
	margin-left: 20px;
	width: 900px;
	height: 600px;
}

div#mainDiv {
	position: relative;
	margin-top: 20px;
	margin-left: 20px;
	width: 900px;
	height: 600px;
}

body{
	background-color: #003748;
}

</style>
<script>
	var main_div;
	var main_menu;
	var home_tabbar;
	var query_grid;
	var insert_layout;
	var insert_form;
	var insert_toolbar;
	var query_layout;
	var query_form;
	
	function doInsertFormValidate(){
		insert_form.validate();
	}
	
	function doInsertFormCancel(){
		insert_form.resetValidateCss();
		insert_form.reset();
		insert_form.lock();
	}
	
	function doOnNewItem(){
		insert_form.unlock();
		insert_form.resetValidateCss();
		insert_form.reset();
	}
	
	function doOnLoad() {
		
		var formData = [
					{type: "settings", position: "label-left", labelWidth: 120, inputWidth: 120},
					{type: "input", label: "Name", value: "John Smith"},
					{type: "password", label: "Password", value: "123"},
					{type: "select", label: "Session", options:[
						{value: "1", text: "Administration"},
						{value: "2", text: "Design"},
						{value: "3", text: "Manage Articles"}
					]},
					{type: "calendar", dateFormat: "%Y-%m-%d %H:%i", name: "start_date", label: "Start Date", value:"2011-06-20 14:38", enableTime: true, calendarPosition: "right"},
					{type: "calendar", name: "end_date", label: "End Date", dateFormat: "%Y-%m-%d", serverDateFormat: "%d.%m.%Y", value: "20.06.2011", calendarPosition: "right"}
				];
		main_div = new dhtmlXLayoutObject("mainDiv", "1C");
		main_menu = main_div.cells("a").attachMenu({
			icon_path: "imgs/dhtmlx/dhtmlxToolbar/",
			xml: "xml/main_menu.xml"
		});
		home_tabbar = main_div.cells("a").attachTabbar();
// 		home_tabbar = new dhtmlXTabBar("homeTabbar");
		
		home_tabbar.addTab("a1", "Alta", null, null, true);
		home_tabbar.addTab("a2", "Consulta");
		home_tabbar.addTab("a3", "Reportes");
		
		//New item
		insert_layout = home_tabbar.tabs("a1").attachLayout({
		    pattern: "3L",
		    cells: [
		        {id: "a", text: "Iventario", header: false, collapse: false, fixSize: [true, true]},
		        {id: "b", text: "Codigo", width: 400, height: 200, collapse: false, fixSize: [true, true]},
		        {id: "c", text: "Lista", collapse: false, fixSize: [true, true]}
		    ]
		});
		
		insert_form = insert_layout.cells("a").attachForm();
		insert_form.load("xml/insert_form.xml");
// 		insert_form.load(formData);
		insert_form.attachEvent("onButtonClick", function(name){
			window[name]();
		});
		insert_form.lock();
		
		insert_toolbar = insert_layout.cells("a").attachToolbar({
			icon_path: "imgs/dhtmlx/dhtmlxToolbar/",
			xml: "xml/insert_toolbar.xml" 
		});
		
		insert_toolbar.attachEvent("onClick", function(name){
			window[name]();
		});
		
		//Filters
		query_layout = home_tabbar.tabs("a2").attachLayout({
		    pattern: "2E",
		    cells: [
		        {id: "a", text: "Filtro", header: true, height: 200},
		        {id: "b", text: "Resultado", header: false}
		    ]
		});
		
		query_form = query_layout.cells("a").attachForm();
		query_form.load("xml/query_form.xml");
		query_form.attachEvent("onButtonClick", function(name){
			window[name]();
		});
		
		query_layout.cells("b").attachToolbar({
			icon_path: "imgs/dhtmlx/dhtmlxToolbar/",
			xml: "xml/query_toolbar.xml"
		});
		
		//Reports
		home_tabbar.tabs("a3").attachToolbar({
			icon_path: "imgs/dhtmlx/dhtmlxToolbar/",
			xml: "xml/query_toolbar.xml"
		});
		
		query_grid = home_tabbar.tabs("a3").attachGrid();
		query_grid.loadXML("xml/query_grid.xml");
		query_grid.setImagePath("js/dhtmlx/skins/web/imgs/dhxgrid_web/");
	}
</script>
</head>
<body onload="doOnLoad();">
	<div id="mainDiv"></div>
</body>
</html>