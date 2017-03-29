package filters;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter({ "/my/*" })
public class AuthFilter implements Filter {

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException{
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;

		HttpSession session = request.getSession();
		String auth = (String)session.getAttribute("auth");
		
		if(auth==null){
			auth="no";
		}
		
		if (auth.equals("yes")) {
			chain.doFilter(req, resp);
		} else {
			// response.sendRedirect("/login/form.jsp");
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out = resp.getWriter();
			out.println("<h3>접근거부</h3>");
			out.println("야 이거 버튼도 안만들어 놨는데 여기 들어온놈은 뭐하는 놈이야 jsp조금 배운놈 같은데 회원가입 얼마 안걸리니까 들어오고 싶으면  로그인하고 와라");
			try {
				Thread.sleep(300);
			} catch (InterruptedException e) {
				
				e.printStackTrace();
			}
			out.print("<meta http-equiv=\"refresh\" content=\"1;url=/\"/>");
			//response.sendRedirect(request.getContextPath()+"/");

		}
	}

}
