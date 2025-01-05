	package servlets;
	
	import java.io.IOException;
	import java.sql.SQLException;
	
	import jakarta.servlet.annotation.WebServlet;
	import jakarta.servlet.http.HttpServlet;
	import jakarta.servlet.http.HttpServletRequest;
	import jakarta.servlet.http.HttpServletResponse;
	
	@WebServlet("/LoginServlet")
	public class LoginServlet extends HttpServlet{
		public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
			String username = (String) req.getParameter("username");
			String pass = (String) req.getParameter("pass");
			
			DAO example = new DAO();
			
			try {
				if (example.check(username, pass)) {
					req.getSession().setAttribute("username", username);
					res.getWriter().print(req.getContextPath());
					res.sendRedirect(req.getContextPath() + "/JSP/welcome.jsp");
				}else {
					res.sendRedirect(req.getContextPath() + "/JSP/login.jsp");
				}
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
