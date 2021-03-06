package mx.com.icsp.service;

import mx.com.icsc.common.Asset;

public interface AssetService {

	public Asset[] getAsset(String idTransaction);
	public int insertAsset(String idTransaction, Asset asset);
	public Asset getAssetById(String idTransaction, String idAsset);
	long getTag(String idTransaction, long idLedger, String idSubclass);
}
