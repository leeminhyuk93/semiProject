package com.javalab.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalab.dao.MemberDao;
import com.javalab.vo.MemberVo;



/**
 * Servlet implementation class joinServlet
 */
@WebServlet("/join")
public class joinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public joinServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("joinServlet doPost()");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		System.out.println("회원 가입 페이지로 이동");
		
		String contextPath = request.getContextPath();
		
		String user_id = request.getParameter("id");
		String password = request.getParameter("pwd");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		
		System.out.println("user_id : " + user_id);
		
		PrintWriter out = response.getWriter();
		if (user_id.equals("") || password.equals("") || name.equals("") || phone.equals("") || email.equals("")) {
			out.println("<script>");
			out.println("alert('빈칸을 채워 주세요.')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			MemberVo member = new MemberVo(user_id, password, name, phone, email);
			MemberDao memberDao = MemberDao.getInstance();
			int result = memberDao.join(member);
			if (result == 0) {
				out.println("<script>");
				out.println("alert('이미 존재하는 아이디입니다.')");
				out.println("history.back()");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('회원가입이 완료되었습니다')");
				out.println("</script>");
				
				HttpSession session = request.getSession();
			    session.setAttribute("user_id", user_id);
				
				response.sendRedirect(contextPath + "/main/main.jsp");
			}
		}
	}
}
