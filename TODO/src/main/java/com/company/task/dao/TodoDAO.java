package com.company.task.dao;

import java.util.List;

import com.company.task.vo.TodoVO;

public interface TodoDAO {

	// todo 전체 출력
	List<TodoVO> todoSelectAll();

	// todo 선택 출력
	List<TodoVO> todoSelectPart(int idx);

	// todo 등록
	int todoInsert(TodoVO todoVO);

	// todo 삭제
	int todoDelete(int idx);

	// todo 수정
	int todoUpdate(TodoVO todoVO);

	// todo 이동
	int todoUpdatePart(int idx);
}
