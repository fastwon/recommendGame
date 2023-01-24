package com.fast.nov041.game;

import javax.servlet.http.HttpServletRequest;

public class GameDAO {
	public void enterGame(Game gm, HttpServletRequest req) {
		String gameName = gm.getGameName();
		String result = "https://www.youtube.com/results?search_query=" + gameName;
		req.setAttribute("r", result);
	}
}
