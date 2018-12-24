package com.company.task.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.company.task.service.TodoService;
import com.company.task.vo.TodoVO;

@RestController
@RequestMapping(value = "/todo")
public class TodoController {

	@Autowired
	TodoService todoService;

	// todo 전체 출력
	@RequestMapping(method = RequestMethod.GET)
	public List<TodoVO> todoSelectAll() {

		List<TodoVO> result = todoService.todoSelectAll();

		return result;
	}

	// todo 선택 출력
	@RequestMapping(value = "/{todo_idx}", method = RequestMethod.GET)
	public List<TodoVO> todoSelectPart(@PathVariable("todo_idx") int idx) {

		List<TodoVO> result = todoService.todoSelectPart(idx);

		return result;
	}

	// todo 등록
	@RequestMapping(method = RequestMethod.POST)
	public int todoInsert(TodoVO todoVO) {

		return todoService.todoInsert(todoVO);
	}

	// todo 삭제
	@RequestMapping(value = "/{todo_idx}", method = RequestMethod.DELETE)
	public int todoDelete(@PathVariable("todo_idx") int idx) {

		return todoService.todoDelete(idx);
	}

	// todo 수정
	@RequestMapping(value = "/{todo_idx}", method = RequestMethod.PUT)
	public int todoUpdate(@RequestBody TodoVO todoVO) {
		
		return todoService.todoUpdate(todoVO);
	}

	// todo 이동
	@RequestMapping(value = "/{todo_idx}", method = RequestMethod.PATCH)
	public int todoUpdatePart(@PathVariable("todo_idx") int idx) {
		
		return todoService.todoUpdatePart(idx);
	}
}
