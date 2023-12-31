package com.stagemate.store.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.stagemate.store.model.vo.Product;
import com.stagemate.store.service.StoreService;


@WebServlet("/store/updateProductLikeCnt.do")
public class StoreUpdateLikeCnt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public StoreUpdateLikeCnt() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productNo=Integer.parseInt(request.getParameter("productNo"));
		int likeCnt=Integer.parseInt(request.getParameter("newLikeCount"));

		int result=new StoreService().updateProductLikeCnt(productNo,likeCnt);
		response.setContentType("application/json;charset=utf-8");
		new Gson().toJson(result,response.getWriter());
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
