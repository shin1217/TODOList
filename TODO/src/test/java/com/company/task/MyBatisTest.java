package com.company.task;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class MyBatisTest {

	@Inject
	private SqlSessionFactory sqlSessionFactory;

	@Test
	public void testSqlSessionFactory() throws Exception {
		System.out.println("sqlSessionFactory " + sqlSessionFactory);
	}

	@Test
	public void testSqlSession() throws Exception {
		try (SqlSession session = sqlSessionFactory.openSession()) {
			System.out.println("SqlSession " + session);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
