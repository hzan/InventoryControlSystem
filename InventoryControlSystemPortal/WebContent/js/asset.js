function doInsertFormSave(){
	insert_form.send("myAsset.do?method=insertAsset","post",function(loader, response){
//		showResponseXmlAlert(loader.xmlDoc.response);
		showResponseXmlAlert(response);
	});
}

function doInsertFormValidate(){
	insert_form.validate();
}

function doInsertFormCancel(){
	insert_form.reset();
	insert_form.lock();
}

function doOnNewItem(){
	insert_form.unlock();
	insert_form.reset();
}

function doOnQueryItem(){
	insert_form.load("myAsset.do?method=getAssetById&idAsset="+insert_toolbar.getValue("query_item_input"), function(){
		showResponseXmlAlert("Se abrio el reistro");
	});
}

dhtmlxError.catchError("load", function(a, b, data) {
	showResponseXmlAlertError('${loading_err}' + '\n' + '${reload_msg}');
});