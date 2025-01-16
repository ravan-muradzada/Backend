	package servlets;
	
	import java.io.IOException;
	
	import jakarta.servlet.annotation.WebServlet;
	import jakarta.servlet.http.HttpServlet;
	import jakarta.servlet.http.HttpServletRequest;
	import jakarta.servlet.http.HttpServletResponse;
	import jakarta.servlet.http.HttpSession;
	
	@WebServlet("/LogoutServlet")
	public class LogoutServlet extends HttpServlet{
		public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException 
		{
			HttpSession ses = req.getSession();
			
			ses.removeAttribute("username");
			ses.invalidate();
			
			res.sendRedirect(req.getContextPath() + "/JSP/login.jsp");
		}
	}
