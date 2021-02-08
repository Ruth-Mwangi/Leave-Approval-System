package com.jkuates.utils;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/**
 * @author Ruth Mwangi This class enables us to make a connection with the
 *         leave_approval_config.xml which then allows us to connect to our
 *         database through mybatis.
 */
public class LeaveApprovalUtil {

	private static SqlSessionFactory sqlSessionFactory;

	public LeaveApprovalUtil() {

	}

	static {
		Reader reader = null;
		try {
			reader = Resources.getResourceAsReader("leave_approval_config.xml");

		} catch (IOException e) {
			throw new RuntimeException(e.getMessage());
		}
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
	}

	public static SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

}
