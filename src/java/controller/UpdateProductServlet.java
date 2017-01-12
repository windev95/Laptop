
package controller;
import dao.ProductDAO;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class UpdateProductServlet extends HttpServlet {
    ProductDAO dao = new ProductDAO();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        java.util.Date date = new Date();
        Timestamp timestamp = new Timestamp(date.getTime());
        FileItemFactory file_factory = new DiskFileItemFactory(); 
        ServletFileUpload sfu = new ServletFileUpload(file_factory); 
        ArrayList<String> campos = new ArrayList<>();
        ArrayList<String> imgs = new ArrayList<>();
        try {
            List items  = sfu.parseRequest(request);
            for (int i = 0; i < items.size(); i++) { 
                FileItem item = (FileItem) items.get(i);
                if(!item.isFormField())
                {
                    File archivo = new File("C:\\Users\\Khang\\Documents\\GitHub\\ShopLaptop\\web\\images\\product\\" + item.getName());
                    item.write(archivo);
                    imgs.add("" + item.getName());
                } else {
                    campos.add(item.getString("UTF-8"));
                }
            }
            dao.update(new Product(Long.parseLong(campos.get(0)),campos.get(1), campos.get(2),imgs.get(0), campos.get(3), campos.get(4), campos.get(5), campos.get(6), campos.get(7), campos.get(8), campos.get(9), campos.get(10), campos.get(11), campos.get(12), campos.get(13), campos.get(14), campos.get(15), campos.get(16), campos.get(17), campos.get(18), campos.get(19), campos.get(20), campos.get(21), campos.get(22),Integer.parseInt(campos.get(23)), Integer.parseInt(campos.get(24)), Integer.parseInt(campos.get(25)), timestamp, Integer.parseInt(campos.get(26)), Integer.parseInt(campos.get(27)), Long.parseLong(campos.get(28)), Long.parseLong(campos.get(29)), Long.parseLong(campos.get(30)), Long.parseLong(campos.get(31)), Long.parseLong(campos.get(32)), Long.parseLong(campos.get(33)), Long.parseLong(campos.get(34))));
        } catch (Exception e) {
        }
        response.sendRedirect("/Admin/manager_product.jsp");
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
