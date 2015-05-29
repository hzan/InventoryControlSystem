package mx.com.icsp.persistence.dao;

import java.util.List;

import mx.com.icsc.common.AssetType;
import mx.com.icsc.common.Color;
import mx.com.icsc.common.Material;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.mapping.StatementType;

public interface CatalogDao {

	static final String SELMATERIAL = "SELECT FIIDMATERIAL ID, FCDESCRIPTION DESCRIPTION FROM CISDB.CTCISMATERIAL ORDER BY FIIDMATERIAL ASC";
	static final String SELCOLOR = "SELECT FIIDCOLOR ID, FCDESCRIPTION DESCRIPTION FROM CISDB.CTCISCOLOR ORDER BY FIIDCOLOR ASC";
	static final String SELASSETTYPE = "SELECT FIIDASSETTYPE ID, FCDESCRIPTION DESCRIPTION FROM CISDB.CTCISASSETTYPE ORDER BY FIIDASSETTYPE ASC";
	
	@Select(SELMATERIAL)
	@Options(statementType = StatementType.CALLABLE)
	public abstract List<Material> getMaterial();

	@Select(SELCOLOR)
	@Options(statementType = StatementType.CALLABLE)
	public abstract List<Color> getColor();

	@Select(SELASSETTYPE)
	@Options(statementType = StatementType.CALLABLE)
	public abstract List<AssetType> getAssetType();
	
	
}
