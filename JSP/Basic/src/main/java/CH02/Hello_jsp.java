package CH02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Hello_jsp extends HttpServlet {
	
	int count = 0;
	
	public void jspService(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		
		PrintWriter out = res.getWriter();
		res.setContentType("text/html");
		out.write("<html><body>");
		
		out.write("Page count is:");
		out.print(++count);
		out.write("</body></html>");
	}

}
