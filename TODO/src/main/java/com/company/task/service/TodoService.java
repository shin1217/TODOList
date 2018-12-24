package com.company.task.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.task.dao.TodoDAO;
import com.company.task.vo.TodoVO;

@Service
public class TodoService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private TodoDAO todoDAO;

	// todo 전체 출력
	public List<TodoVO> todoSelectAll() {
		todoDAO = sqlSessionTemplate.getMapper(TodoDAO.class);

		return todoDAO.todoSelectAll();
	}

	// todo 선택 출력
	public List<TodoVO> todoSelectPart(int idx) {
		todoDAO = sqlSessionTemplate.getMapper(TodoDAO.class);

		return todoDAO.todoSelectPart(idx);
	}

	// todo 등록
	public int todoInsert(TodoVO todoVO) {
		int result = 0;
		todoDAO = sqlSessionTemplate.getMapper(TodoDAO.class);

		try {
			result = todoDAO.todoInsert(todoVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// todo 삭제
	public int todoDelete(int idx) {
		int result = 0;
		todoDAO = sqlSessionTemplate.getMapper(TodoDAO.class);

		try {
			result = todoDAO.todoDelete(idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// todo 수정
	public int todoUpdate(TodoVO todoVO) {
		int result = 0;
		todoDAO = sqlSessionTemplate.getMapper(TodoDAO.class);

		try {
			result = todoDAO.todoUpdate(todoVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// todo 이동
	public int todoUpdatePart(int idx) {
		int result = 0;
		todoDAO = sqlSessionTemplate.getMapper(TodoDAO.class);

		try {
			result = todoDAO.todoUpdatePart(idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
