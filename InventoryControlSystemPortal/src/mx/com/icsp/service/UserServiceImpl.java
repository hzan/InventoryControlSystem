package mx.com.icsp.service;

import java.util.HashMap;
import java.util.Map;

import mx.com.icsc.common.User;
import mx.com.icsc.common.util.LogPattern;
import mx.com.icsp.persistence.dao.UserDao;
import mx.com.icsp.util.Constants;

import org.apache.log4j.Logger;

public class UserServiceImpl implements UserService{

	Logger log = Logger.getLogger(this.getClass());
	LogPattern logPattern = new LogPattern(Constants.domainCode,
			Constants.solutioNameCode, Constants.platform, Constants.tower,
			this.getClass().getName());
	
	UserDao userDao;
	public void setUserDao(UserDao userDao){
		this.userDao = userDao;
	}
	
	@Override
	public User getUser(String idTransaction, String username) {
		String methodName = new Throwable().getStackTrace()[0].getMethodName();
		
		User user = null;
		try{
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("username", username);
		    user = userDao.getUser(map);
		}catch(Exception e){
			log.error(logPattern.buildPattern(methodName, idTransaction, "Exception", e.getMessage()), e);
		}
		return user;
	}

}
