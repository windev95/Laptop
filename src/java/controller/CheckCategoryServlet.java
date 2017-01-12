package controller;

import dao.CategoryDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CheckCategoryServlet extends HttpServlet {
    CategoryDAO CategoryDAO = new CategoryDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (CategoryDAO.checkCategory(request.getParameter("tenDanhMuc"))) {
            response.getWriter().write("<img src=\"images/shop/not-available.png\" />");
        } else {
            response.getWriter().write("<img src=\"images/shop/available.png\" />");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
