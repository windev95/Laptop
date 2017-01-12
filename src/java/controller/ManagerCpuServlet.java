package controller;
import dao.CpuDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cpu;
public class ManagerCpuServlet extends HttpServlet {
    CpuDAO dao = new CpuDAO();
    
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
        String cpu_id = request.getParameter("cpu_id");
        String url = "";
        try {
            switch (command) {
                case "delete":
                    dao.delete(Long.parseLong(cpu_id));
                    url = "/Admin/manager_cpu.jsp";
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
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String name = request.getParameter("name");
        String url = "", error = "";
        if (name.equals("")) {
            error = "Vui lòng nhập tên!";
            request.setAttribute("error", error);
        }
        try {
            if (error.length() == 0) {
                switch (command) {
                    case "insert":
                        dao.insert(new Cpu(name));
                        url = "/Admin/manager_cpu.jsp";
                        break;
                    case "update":
                        dao.update(new Cpu(Long.parseLong(request.getParameter("cpu_id")), name));
                        url = "/Admin/manager_cpu.jsp";
                        break;
                }
            } else {
                url = "/Admin/insert_cpu.jsp";
            }
        } catch (Exception e) {
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }
}
