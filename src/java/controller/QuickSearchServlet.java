package controller;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class QuickSearchServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet QuickSearchServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet QuickSearchServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        
        String lsp = (request.getParameter("lsp"));
        session.setAttribute("lsp", lsp);
        
        String nsx = (request.getParameter("nsx"));
        session.setAttribute("nsx", nsx);
        
        String khoanggia = (request.getParameter("khoanggia"));
        session.setAttribute("khoanggia", khoanggia);
        
        String manhinh = (request.getParameter("manhinh"));
        session.setAttribute("manhinh", manhinh);
        
        String cpu = (request.getParameter("cpu"));
        session.setAttribute("cpu", cpu);
        
        String ram = (request.getParameter("ram"));
        session.setAttribute("ram", ram);
        
        String ocung = (request.getParameter("ocung"));
        session.setAttribute("query", ocung);
        
        response.sendRedirect("/quicksearch.jsp?lsp="+lsp+"&nsx="+nsx+"&khoanggia="+khoanggia+"&manhinh="+manhinh+"&cpu="+cpu+"&ram="+ram+"&ocung="+ocung+"&pages=1");
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
