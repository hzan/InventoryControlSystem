package mx.com.icsp.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mx.com.icsp.service.AssetService;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

public class AssetAction extends DispatchAction{

	AssetService assetService;
	public void setAssetService(AssetService assetService){
		this.assetService = assetService;
	}
	
	public void getAsset(ActionMapping arg0, ActionForm arg1,
			HttpServletRequest arg2, HttpServletResponse arg3) throws Exception {
		
		
	}
	
}
