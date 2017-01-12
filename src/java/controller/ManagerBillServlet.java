package controller;
import dao.BillDAO;
import dao.CategoryDAO;
import java.io.IOException;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;
public class ManagerBillServlet extends HttpServlet {
    BillDAO dao = new BillDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String bill_id = request.getParameter("bill_id");
        String url = "";
        try {
            switch (command) {
                case "delete":
                    dao.delete(Long.parseLong(bill_id));
                    url = "/Admin/index.jsp";
                    break;
                case "update":
                    dao.update(Long.parseLong(bill_id));
                    url = "/Admin/index.jsp";
                    break;
                case "finish":
                    dao.finish(Long.parseLong(bill_id));
                    url = "/Admin/index.jsp";
                    break;    
            }
        } catch (Exception e) {
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);   
    }
}
