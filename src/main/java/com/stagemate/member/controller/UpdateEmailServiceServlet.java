package com.stagemate.member.controller;

import static com.stagemate.common.JDBCTemplate.close;
import static com.stagemate.common.JDBCTemplate.getConnection;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.stagemate.member.model.vo.Member;


@WebServlet("/member/UpdateEmailServiceServlet")
public class UpdateEmailServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UpdateEmailServiceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		String email = request.getParameter("email");
		int result = 0;
		
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    
	    try {
	        conn.setAutoCommit(false); // 트랜잭션 시작
	        
	        if (!memberId.equals("")) {
	        	String query = "UPDATE MEMBER_TB "
		                + "SET MEMBER_EMAIL = ? "
		                + "WHERE MEMBER_ID = ?";

		        pstmt = conn.prepareStatement(query);
		        pstmt.setString(1, email);
		        pstmt.setString(2, memberId);
		        result = pstmt.executeUpdate();
		        conn.commit();
	        }
	    } catch (SQLException e) {
	        try {
	            conn.rollback();
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	        e.printStackTrace();

	    } finally {
	        try {
	            conn.setAutoCommit(true);
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	        }
	        close(rs);
	        close(pstmt);
	    }
	    close(conn);
	    
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
