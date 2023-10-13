package com.fast.nov041.game;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class GameController {

	@RequestMapping(value = "/recommend.do", method = RequestMethod.GET)
	public String recommendGame(HttpServletRequest req) {
		return "output";
	}
}
