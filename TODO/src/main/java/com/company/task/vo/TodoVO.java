package com.company.task.vo;

import org.apache.ibatis.type.Alias;

@Alias("todoVO")
public class TodoVO {
	private int todo_idx;
	private String todo_title;
	private String todo_content;
	private String todo_rank;
	private String todo_deadline;
	private String todo_check;
	private String todo_date;

	public int getTodo_idx() {
		return todo_idx;
	}

	public void setTodo_idx(int todo_idx) {
		this.todo_idx = todo_idx;
	}

	public String getTodo_title() {
		return todo_title;
	}

	public void setTodo_title(String todo_title) {
		this.todo_title = todo_title;
	}

	public String getTodo_content() {
		return todo_content;
	}

	public void setTodo_content(String todo_content) {
		this.todo_content = todo_content;
	}

	public String getTodo_rank() {
		return todo_rank;
	}

	public void setTodo_rank(String todo_rank) {
		this.todo_rank = todo_rank;
	}

	public String getTodo_deadline() {
		return todo_deadline;
	}

	public void setTodo_deadline(String todo_deadline) {
		this.todo_deadline = todo_deadline;
	}

	public String getTodo_check() {
		return todo_check;
	}

	public void setTodo_check(String todo_check) {
		this.todo_check = todo_check;
	}

	public String getTodo_date() {
		return todo_date;
	}

	public void setTodo_date(String todo_date) {
		this.todo_date = todo_date;
	}

	@Override
	public String toString() {
		return "TodoVO [todo_idx=" + todo_idx + ", todo_title=" + todo_title + ", todo_content=" + todo_content
				+ ", todo_rank=" + todo_rank + ", todo_deadline=" + todo_deadline + ", todo_check=" + todo_check
				+ ", todo_date=" + todo_date + "]";
	}

}
