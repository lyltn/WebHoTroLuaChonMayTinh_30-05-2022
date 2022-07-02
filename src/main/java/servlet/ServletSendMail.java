package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.Authenticator;
import java.util.Properties;

import javax.mail.PasswordAuthentication;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.Session;

/**
 * Servlet implementation class ServletSendMail
 */
@WebServlet("/ServletSendMail")
public class ServletSendMail extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        
        String to = request.getParameter("to");
        String subject = request.getParameter("subject");
        String message =  request.getParameter("message");
       System.out.println(to+subject+message);
        SendMail.send(to,subject, message, "os21it1vku@gmail.com", "1234ngocly");
       response.sendRedirect("addmin.jsp");		
		
	 
	}

}
