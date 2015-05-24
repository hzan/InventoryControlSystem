package mx.com.icsp.persistence.dao;

import java.util.Map;

import mx.com.icsc.common.User;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.mapping.StatementType;

public interface UserDao {
	
//	String OPER_GET_AVATARBYLEVEL = "CALL SCSMPT360.SPSMPSELAVATARBYLEVEL  ("
//			+ "#{level, mode=IN, jdbcType=INTEGER}, "
//			+ "#{blocked, mode=IN, jdbcType=INTEGER}, "
//			+ "#{CUR1, mode=OUT, jdbcType=CURSOR, javaType=java.sql.ResultSet, resultMap=getAvatars} )";

	static final String SPCISSELUSER = "{CALL CISDB.SPCISSELUSER("
			+ "#{username, mode=IN, jdbcType=VARCHAR}"
			+ ")}";
	
	@Insert(SPCISSELUSER)
	@Options(statementType = StatementType.CALLABLE)
//	@ResultMap(value={"User"})
	public abstract User getUser(Map<String, Object> params);

}
