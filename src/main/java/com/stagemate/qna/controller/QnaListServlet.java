package com.stagemate.qna.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.stagemate.qna.model.service.QnaService;
import com.stagemate.qna.model.vo.Qna;
import com.stagemate.qna.model.vo.QnaListCtg;

/**
 * Servlet implementation class QnaServlet
 */
@WebServlet("/qna/qnaList.do")
public class QnaListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cPage,numPerpage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		try {
			numPerpage=Integer.parseInt(request.getParameter("numPerpage"));
		}catch(NumberFormatException e) {
			numPerpage=5;
		}
		List<Qna> qnas= new QnaService().selectQna(cPage,numPerpage);
		String pageBar="";
		int totalData= new QnaService().selectQnaCount();
		int totalPage= (int)Math.ceil((double)totalData/numPerpage);
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		if(pageNo==1) {
			pageBar+="<span>[이전]</span>";
		}else {
			pageBar+="<a href='"+request.getRequestURI()+"?cPage="+(pageNo-1)
					+"$numPerpage="+numPerpage+"'>[이전]</a>";
			
		}
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar +="<span>"+pageNo+"</span>";
				
			}else{
				pageBar+="<a href='"+request.getRequestURI()+"?cPage="+(pageNo)
			
					+"$numPerpage="+numPerpage+"'>"+pageNo+"</a>";
		}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar +="<span>[다음]</span>";
			
		}else{
			pageBar+="<a href='"+request.getRequestURI()+"?cPage="+(pageNo)
				+"$numPerpage="+numPerpage+"'>[다음]</a>";
		}
			request.setAttribute("pageBar", pageBar);
			request.setAttribute("qnas", qnas);
			System.out.println(qnas);
			List<QnaListCtg> qc= new QnaService().selectQnaListCtg();
			request.setAttribute("qc", qc);
		request.getRequestDispatcher("/views/qna/qnaBoardList.jsp")
		.forward(request, response);
	}
		
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
