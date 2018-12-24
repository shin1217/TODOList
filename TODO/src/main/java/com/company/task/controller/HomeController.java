package com.company.task.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.company.task.service.TodoService;

@Controller
public class HomeController {
	
	@Autowired
	TodoService todoService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {

		return "todoList";
	}
}
