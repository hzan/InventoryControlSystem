function exportExcel() {
	// window.dhx4.ajax.post("myReport.do", "method=getAssetXml", function() {
	// });
	var dhxWins2 = new dhtmlXWindows();
	dhxWins2.attachViewportTo("mainDiv");

	var export_excel_window = dhxWins2.createWindow({
		id : "exportExcelWindow",
		left : 0,
		right : 0,
		width : 300,
		height : 200,
		center : true,
		move : false,
		modal : true,
		resize : false,
		caption : "Exportar Excel",
		header : true
	});
	export_excel_window.button('park').hide();
	export_excel_window.button('minmax').hide();
	export_excel_window.keepInViewport(true);

	// var export_excel_window = dhxWins2.createWindow("exportExcelWindow", 0,
	// 0, 300, 200);
	// export_excel_window.setText("Exportar Excel");
	// export_excel_window.setModal(true);
	// export_excel_window.button('park').hide();
	// export_excel_window.button('minmax').hide();
	// export_excel_window.denyResize();
	// export_excel_window.centerOnScreen();
	// export_excel_window.keepInViewport(true);

	var export_excel_form = export_excel_window.attachForm();
	export_excel_form.loadStruct("xml/export_excel_form.xml");
}

function doLink(name, value) {
	return '<a href="myReport.do?method=getAssetXml">' + value + '</a>';
}