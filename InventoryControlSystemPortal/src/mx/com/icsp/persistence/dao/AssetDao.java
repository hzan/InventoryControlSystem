package mx.com.icsp.persistence.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.mapping.StatementType;

public interface AssetDao {

	static final String SPCISSELASSET = "{CALL SPCISSELASSET()}";
	static final String SPCISSELASSETBYID = "{CALL SPCISSELASSETBYID("
			+ "#{id, mode=IN, jdbcType=INTEGER}"
			+ ")}";
	
	static String OPER_GET_AVATARBYLEVEL = "CALL SPSMPSELAVATARBYLEVEL("
			+ "#{level, mode=IN, jdbcType=INTEGER}, "
			+ "#{blocked, mode=IN, jdbcType=INTEGER}, "
			+ "#{CUR1, mode=OUT, jdbcType=CURSOR, javaType=java.sql.ResultSet, resultMap=getAvatars} )";
	
	static final String OPER_INS_PETICION = "CALL SPSMPINSPETITION ("
			+ "#{mdn, mode=IN, jdbcType=INTEGER}, "
			+ "#{date, mode=IN, jdbcType=DATE}, "
			+ "#{nip, mode=IN, jdbcType=VARCHAR}, "
			+ "#{type, mode=IN, jdbcType=INTEGER})";

	@Insert(SPCISSELASSET)
	@Options(statementType = StatementType.CALLABLE)
	public abstract void getAsset(Map<String, Object> params);
	
	@Insert(SPCISSELASSETBYID)
	@Options(statementType = StatementType.CALLABLE)
	public abstract void getAssetById(Map<String, Object> params);
}