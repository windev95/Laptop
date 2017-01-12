
package controller;

import dao.FeedbackDAO;
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
import model.Feedback;

/**
 *
 * @author Toan
 */
public class FeedbackServlet extends HttpServlet {
    FeedbackDAO feedbackDAO = new FeedbackDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet FeedbackServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FeedbackServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String feedback_id = request.getParameter("feedback_id");
        String url = "";
        try {
            switch (command) {
                case "delete":
                    feedbackDAO.delete(Long.parseLong(feedback_id));
                    url = "/Admin/feedback.jsp";
                    break;
                case "finish":
                    feedbackDAO.finish(Long.parseLong(feedback_id));
                    url = "/Admin/feedback.jsp";
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
        String url = "";
        Feedback feedback = new Feedback();
        feedback.setFeedbackID(new java.util.Date().getTime());
        feedback.setFeedbackName(request.getParameter("name"));
        feedback.setFeedbackEmail(request.getParameter("email"));
        feedback.setFeedbackText(request.getParameter("message"));
        try {
            feedbackDAO.insert(feedback);
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        url = "/index.jsp";
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
