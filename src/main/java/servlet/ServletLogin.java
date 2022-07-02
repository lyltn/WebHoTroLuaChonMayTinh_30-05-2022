package servlet;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;


import connect.Dao;

import javax.servlet.http.HttpSession;

@WebServlet("/ServletLogin")
public class ServletLogin extends HttpServlet {
	private final String invalidPage = "addmin.jsp";
	private final String searchPage = "login.jsp";
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
		String username= request.getParameter("txtUsername");
		String password= request.getParameter("txtpassword");
		String url = invalidPage;
			Dao dao = new Dao();
			try {
				boolean nd = dao.checkLogin(username, password);
				
				System.out.println(nd);
					if(nd) {
						
						
						url = invalidPage;
						
					}if(nd==false) {
						HttpSession session = request.getSession();
						session.setAttribute("USER", password);
						url = searchPage;
						request.setAttribute("SEARCHRESULT", "DSDSFSD");
					}
					
					
					
					
						
				
				RequestDispatcher rd = request.getRequestDispatcher(url);
				rd.forward(request, response);
		}catch(Exception e1) {
			e1.printStackTrace();
//			JOptionPane.showMessageDialog(null,  e1.getMessage(),"Lỗi", JOptionPane.ERROR_MESSAGE);
			
		}
			
	
		
	}

}
