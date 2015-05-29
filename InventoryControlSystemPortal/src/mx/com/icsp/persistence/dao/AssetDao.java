package mx.com.icsp.persistence.dao;

import java.util.List;
import java.util.Map;

import mx.com.icsc.common.Asset;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.mapping.StatementType;

public interface AssetDao {

	static final String SELASSET = "SELECT"
			+ " FIIDASSET 'id', FIIDLEDGER idLedger, CTAT.FIIDASSETTYPE IDASSETTYPE,"
			+ " CTAT.FCDESCRIPTION ASSETTYPE, TAAT.FCDESCRIPTION description, IF(TAAT.FCBRAND IS NOT NULL, TAAT.FCBRAND, 'ND')brand,"
			+ " IF(TAAT.FCMODEL IS NOT NULL, TAAT.FCMODEL, 'ND') model, IF(TAAT.FCSERIALNUMBER IS NOT NULL, TAAT.FCSERIALNUMBER, 'ND') serialNumber, CTMA.FIIDMATERIAL idMaterial,"
			+ " CTMA.FCDESCRIPTION material, CTCO.FIIDCOLOR idcolor, CTCO.FCDESCRIPTION color,"
			+ " TAAT.FCSUPPLIER supplier, IF(TAAT.FCGENERALMANAGER IS NOT NULL, TAAT.FCGENERALMANAGER, 'ND') generalManager, IF(TAAT.FCDIRECTLYRESPONSIBLE IS NOT NULL, TAAT.FCDIRECTLYRESPONSIBLE, 'ND') directlyResponsible,"
			+ " IF(TAAT.FITAG IS NOT NULL, TAAT.FITAG, 0) tag, TAAT.FCBILL bill, TAAT.FDBILLINGDATE billingDate, IF(TAAT.FCLOCATION IS NOT NULL, TAAT.FCLOCATION, 'ND') location,"
			+ " TAAT.FDUSEDATE useDate, TAAT.FNPRICE price, IF(TAAT.FCGENERALLOCATION IS NOT NULL, TAAT.FCGENERALLOCATION, 'ND') generalLocation,"
			+ " IF(TAAT.FCSECURE IS NOT NULL, TAAT.FCSECURE, 'ND') secure, TAAT.FDREGISTERDATE registerDate, TAAT.FDLASTUPDATE lastUpdate"
			+ " FROM" + " CISDB.TACISASSET TAAT "
			+ " INNER JOIN CISDB.CTCISASSETTYPE CTAT ON"
			+ " TAAT.FIIDASSETTYPE = CTAT.FIIDASSETTYPE"
			+ " INNER JOIN CISDB.CTCISMATERIAL CTMA ON"
			+ " TAAT.FIIDMATERIAL = CTMA.FIIDMATERIAL"
			+ " INNER JOIN CISDB.CTCISCOLOR CTCO ON"
			+ " TAAT.FIIDCOLOR = CTCO.FIIDCOLOR"
			+ " ORDER BY FIIDASSET ASC";

	static final String SELASSETBYID = "SELECT"
			+ " FIIDASSET 'id', FIIDLEDGER idLedger, CTAT.FIIDASSETTYPE IDASSETTYPE,"
			+ " CTAT.FCDESCRIPTION ASSETTYPE, TAAT.FCDESCRIPTION description, IF(TAAT.FCBRAND IS NOT NULL, TAAT.FCBRAND, '')brand,"
			+ " IF(TAAT.FCMODEL IS NOT NULL, TAAT.FCMODEL, '') model, IF(TAAT.FCSERIALNUMBER IS NOT NULL, TAAT.FCSERIALNUMBER, '') serialNumber, CTMA.FIIDMATERIAL idMaterial,"
			+ " CTMA.FCDESCRIPTION material, CTCO.FIIDCOLOR idcolor, CTCO.FCDESCRIPTION color,"
			+ " TAAT.FCSUPPLIER supplier, IF(TAAT.FCGENERALMANAGER IS NOT NULL, TAAT.FCGENERALMANAGER, '') generalManager, IF(TAAT.FCDIRECTLYRESPONSIBLE IS NOT NULL, TAAT.FCDIRECTLYRESPONSIBLE, '') directlyResponsible,"
			+ " IF(TAAT.FITAG IS NOT NULL, TAAT.FITAG, 0) tag, TAAT.FCBILL bill, TAAT.FDBILLINGDATE billingDate, IF(TAAT.FCLOCATION IS NOT NULL, TAAT.FCLOCATION, '') location,"
			+ " TAAT.FDUSEDATE useDate, TAAT.FNPRICE price, IF(TAAT.FCGENERALLOCATION IS NOT NULL, TAAT.FCGENERALLOCATION, '') generalLocation,"
			+ " IF(TAAT.FCSECURE IS NOT NULL, TAAT.FCSECURE, '') secure, TAAT.FDREGISTERDATE registerDate, TAAT.FDLASTUPDATE lastUpdate"
			+ " FROM" + " CISDB.TACISASSET TAAT "
			+ " INNER JOIN CISDB.CTCISASSETTYPE CTAT ON"
			+ " TAAT.FIIDASSETTYPE = CTAT.FIIDASSETTYPE"
			+ " INNER JOIN CISDB.CTCISMATERIAL CTMA ON"
			+ " TAAT.FIIDMATERIAL = CTMA.FIIDMATERIAL"
			+ " INNER JOIN CISDB.CTCISCOLOR CTCO ON"
			+ " TAAT.FIIDCOLOR = CTCO.FIIDCOLOR"
			+ " WHERE FIIDASSET = #{idAsset}";

	static final String INSASSET = "Insert into CISDB.TACISASSET (FIIDLEDGER,FIIDASSETTYPE,FCDESCRIPTION,FCBRAND,FCMODEL,FCSERIALNUMBER,FIIDMATERIAL,FIIDCOLOR,"
			+ "FCSUPPLIER,FCGENERALMANAGER,FCDIRECTLYRESPONSIBLE,FITAG,FCBILL,FDBILLINGDATE,FCLOCATION,FDUSEDATE,FNPRICE,FCGENERALLOCATION,FCSECURE) "
			+ "values "
			+ "(#{idLedger}, #{idAssetType}, #{description}, #{brand}, #{model}, #{serialNumber}, #{idMaterial}, #{idColor},"
			+ "#{supplier}, #{generalManager}, #{directlyResponsible}, #{tag}, #{bill}, #{billingDate}, #{location}, #{useDate}, #{price}, #{generalLocation}, #{secure})";

	@Select(SELASSET)
	@Options(statementType = StatementType.CALLABLE)
	public abstract List<Asset> getAsset(Map<String, Object> params);

	@Select(SELASSETBYID)
	@Options(statementType = StatementType.CALLABLE)
	public abstract Asset getAssetById(Map<String, Object> params);

	@Insert(INSASSET)
	@Options(statementType = StatementType.CALLABLE)
	public abstract int insertAsset(Asset asset);
}
