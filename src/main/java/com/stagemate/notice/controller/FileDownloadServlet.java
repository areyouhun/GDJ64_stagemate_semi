package com.stagemate.notice.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FileDownloadServlet
 */
@WebServlet("/fileDownload.do")
public class FileDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileDownloadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//파일에 대해 다운로드 기능 구현하기 
		//1. 클라이언트가 보낸 파일이름 받기 
		String fileName= request.getParameter("name");
		//2.파일에 대한 절대경로를 가져옴 
		String path = getServletContext().getRealPath("/upload/nabin");
		File f= new File(path+fileName);
		//3. InputStream을 생성 => fILEiNPUTsTREAM을 생성 
	FileInputStream fis = new FileInputStream(f);
	BufferedInputStream bis= new BufferedInputStream(fis);
	
	//인코딩 분리해서 처리하기 
	String fileRename="";
	String header=request.getHeader("user-agent");
	boolean isMSIE=header.indexOf("MSIE")!=-1||header.indexOf("Trident")!=-1;
	if(isMSIE) {
		fileRename=URLEncoder.encode(fileName,"UTF-8").replaceAll("\\+", "%20");

	}else {
		fileRename=new String(fileName.getBytes("UTF-8"),"ISO-8859-1");
	}
	//응답 헤더 설정 -> contentType설정
	response.setContentType("application/octet-stream");
	response.setHeader("Content-disposition","attachment;filename="+fileRename);
	
	
	//6. 사용자에게 ㅏ일 보내기 
	//클라이언트의 스트림 가져오기 -> getOutputStream();
	ServletOutputStream sos = response.getOutputStream();
	BufferedOutputStream bos= new BufferedOutputStream (sos);
	 int read=-1;
	 while((read=bis.read())!=-1) {
		 bos.write(read);
	 }
	 bis.close();
	 bos.close();
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
