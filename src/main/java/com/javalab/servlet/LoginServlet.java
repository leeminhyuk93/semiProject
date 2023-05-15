package com.javalab.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalab.dao.MemberDao;
import com.javalab.vo.MemberVo;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("LoginServlet doPost()");
		String encoding = "UTF-8";
		request.setCharacterEncoding(encoding);
		
		String id = request.getParameter("username");
		String pwd = request.getParameter("password");
		
		MemberDao dao = MemberDao.getInstance();
		MemberVo inputData = new MemberVo(id, pwd);
		MemberVo member = dao.getMember(inputData);
		
		HttpSession session = request.getSession();
		session.setAttribute("member", member);
		session.setMaxInactiveInterval(60);
		
		String contextPath = request.getContextPath();
		response.sendRedirect(contextPath + "/main/main.jsp");
	}

}
