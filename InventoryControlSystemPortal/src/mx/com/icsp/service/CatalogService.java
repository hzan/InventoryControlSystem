package mx.com.icsp.service;

import mx.com.icsc.common.AssetType;
import mx.com.icsc.common.Color;
import mx.com.icsc.common.Material;

public interface CatalogService {
	
	public Material[] getMaterial(String idTransaction);
	public Color[] getColor(String idTransaction);
	public AssetType[] getAssetType(String idTransaction);
	
}
