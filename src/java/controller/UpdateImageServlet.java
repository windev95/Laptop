
package controller;
import dao.ImageDAO;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Image;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class UpdateImageServlet extends HttpServlet {
    ImageDAO dao = new ImageDAO();
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
            dao.update(new Image(Long.parseLong(campos.get(0)), campos.get(1), imgs.get(0), Long.parseLong(campos.get(2))));
        } catch (Exception e) {
        }
        getServletContext().getRequestDispatcher("/Admin/manager_image.jsp").forward(
                request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
