package controller;

import dao.AdminDAO;
import dao.PqDAO;
import helpers.encrypt;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Admin;
import model.Pq;
public class AdminServlet extends HttpServlet {
    AdminDAO adminDAO = new AdminDAO();
    PqDAO pqDAO = new PqDAO();
    Pq pq = new Pq();
    encrypt encrypt = new encrypt();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String admin_id = request.getParameter("admin_id");
        String url = "";
        try {
            adminDAO.delete(Long.parseLong(admin_id));
        } catch (SQLException ex) {
            Logger.getLogger(AdminServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        url = "/Admin/manager_admin.jsp";
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");        
        String url = "";
        Admin admin = new Admin();
        Long id = new java.util.Date().getTime();
        HttpSession session = request.getSession();
        switch (command) {
            case "insert":
                admin.setAdminID(id);
                admin.setAdminfullName(request.getParameter("fullname"));
                admin.setAdminAvatar(request.getParameter("avatar"));
                admin.setAdminEmail(request.getParameter("email"));
                admin.setAdminPass(encrypt.hashmd5(request.getParameter("email"), request.getParameter("password")));
                admin.setPqID(Integer.parseInt(request.getParameter("pq")));
                adminDAO.insertAdmin(admin);
                url = "/Admin/login.jsp";
                break;
            case "login":
                session.setAttribute("error", "");
                admin = adminDAO.login(request.getParameter("email"), encrypt.hashmd5(request.getParameter("email"), request.getParameter("password")));
                {
                    try { 
                        for (Admin ds : adminDAO.getAdminByEmail(request.getParameter("email")))
                        {
                            session.setAttribute("idAdmin", ds.getAdminID());
                            session.setAttribute("nameAdmin", ds.getAdminfullName());
                            session.setAttribute("emailAdmin", ds.getAdminEmail());
                            session.setAttribute("avatar", ds.getAdminAvatar());                            
                            session.setAttribute("pqAdmin", pqDAO.getPqType(String.valueOf(ds.getPqID())).getPqType());
                        }
                    } catch (SQLException ex) {
                        Logger.getLogger(AdminServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                if (admin != null) {
                    session.setAttribute("admin", admin);
                    url = "/Admin/index.jsp";
                    break;
                }else{
                    session.setAttribute("error", "Email hoặc mật khẩu không đúng.!");
                    url = "/Admin/login.jsp";
                }
                break;
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
        processRequest(request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
