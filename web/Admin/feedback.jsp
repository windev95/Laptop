<%-- 
    Document   : feedback
    Created on : Jan 8, 2017, 7:21:05 PM
    Author     : Toan
--%>
<%@page import="model.Admin"%>
<% 
    Admin admin = (Admin) session.getAttribute("admin");
    String pqAdmin = "";
    if (admin == null) {
        response.sendRedirect("../Admin/login.jsp");
    }else{        
        if(Integer.parseInt(session.getAttribute("pqAdmin").toString()) != 3 && Integer.parseInt(session.getAttribute("pqAdmin").toString()) != 1){
            pqAdmin = "disabled";
        }
    }
%>
<%@page import="dao.FeedbackDAO"%>
<%@page import="model.Feedback"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý góp ý</title>
        <link rel="icon" href="./images/favicon.png" type="image/x-icon" />
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="${root}/Admin/layout/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="${root}/Admin/layout/plugins/datatables/dataTables.bootstrap.css">
        <link rel="stylesheet" href="${root}/Admin/layout/dist/css/AdminLTE.min.css">
        <link rel="stylesheet" href="${root}/Admin/layout/dist/css/skins/_all-skins.min.css">
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <%
            FeedbackDAO feedbackDAO = new FeedbackDAO();
            ArrayList<Feedback> listFeedback = feedbackDAO.getListFeedback();          
        %>
         <div class="wrapper">
            <jsp:include page="./layout/header.jsp"></jsp:include>
            <div class="content-wrapper">
<!--                MAIN------------------------------------------------------------------->
                        <section class="content">
                             <div class="row">
                               <div class="col-xs-12">
                                 <!-- /.box -->
                                 <div class="box">
                                   <div class="box-header">              
                                     <h3 class="box-title">Tất cả góp ý</h3>                                                                       
                                   </div>
                                   <!-- /.box-header -->
                                   <div class="box-body">
                                     <table id="example1" class="table table-bordered table-striped">
                                       <thead>
                                       <tr>
                                            <th>Mã góp ý</th>
                                            <th>Người gửi</th>
                                            <th>Email</th>
                                            <th>Nội dung</th>
                                            <th>Ngày nhận</th>
                                            <th>Xử lý</th> 
                                            <th>Tùy chọn</th> 
                                       </tr>
                                       </thead>
                                       <tbody>
                                        <%
                                            for(Feedback feedback : listFeedback){
                                        %>
                                          <tr>
                                            <td><a href="#" data-toggle="modal" data-target="#myModal<%=feedback.getFeedbackID()%>"><%=feedback.getFeedbackID()%></a></td>                                            
                                            <td><%=feedback.getFeedbackName()%></td>
                                            <td><%=feedback.getFeedbackEmail()%></td>    
                                            <%if(feedback.getFeedbackText().length()>130){%>
                                            <td><%=feedback.getFeedbackText().substring(0,130)+" ..."%></td>
                                            <% }else {%>
                                            <td><%=feedback.getFeedbackText()%></td>
                                            <% }%>                                            
                                            <td><%=feedback.getFeedbackUpdate()%></td>
                                            <td>
                                              <center> 
                                              <% if (feedback.getFeedbackFinish()!=true) {                      
                                                %>
                                                <button <%=pqAdmin%> class="btn btn-primary btn-xs" onclick="location.href='../FeedbackServlet?command=finish&feedback_id=<%=feedback.getFeedbackID()%>'"><i class="glyphicon glyphicon-check"></i> Xác nhận</button>
                                                <%} else {%>
                                                <span class="label label-success"> Hoàn thành</span>
                                                <% }%>
                                              </center>
                                            </td> 
                                            <td>
                                                <center>
                                                    <% if (feedback.getFeedbackFinish()!=true) {                      
                                                    %>
                                                    <button <%=pqAdmin%> class="btn btn-danger btn-xs" disabled onclick="location.href='../FeedbackServlet?command=delete&feedback_id=<%=feedback.getFeedbackID()%>'"><i class="glyphicon glyphicon-remove"></i> Xóa</button>
                                                    <% } else {%>
                                                    <button class="btn btn-danger btn-xs" onclick="location.href='../FeedbackServlet?command=delete&feedback_id=<%=feedback.getFeedbackID()%>'"><i class="glyphicon glyphicon-remove"></i> Xóa</button>
                                                    <% }%>
                                                </center>
                                            </td>
                                          </tr>                                  
                                              <!-- Modal -->
                                                <div class="modal fade" id="myModal<%=feedback.getFeedbackID()%>" role="dialog">
                                                  <div class="modal-dialog modal-lg">

                                                    <!-- Modal content-->
                                                    <div class="modal-content">
                                                      <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"></button>
                                                        <h4 class="modal-title">#<%=feedback.getFeedbackID()%></h4>
                                                      </div>
                                                      <div class="modal-body">
                                                        <p>Người gửi: <%=feedback.getFeedbackName()%></p>
                                                        <p>Email: <%=feedback.getFeedbackEmail()%></p>
                                                        <p>Ngày nhận: <%=feedback.getFeedbackUpdate()%></p><hr>
                                                        <p>Nội dung: <%=feedback.getFeedbackText()%></p>
                                                      </div>
                                                      <div class="modal-footer">
                                                        <a <%=pqAdmin%> href="mailto:<%=feedback.getFeedbackEmail()%>?Subject=ShopLaptop phản hồi góp ý!" class="btn btn-primary pull-left">Send mail!</a>
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                      </div>
                                                    </div>
                                                  </div>
                                                </div>
                                       <!-- /Modal -->
                                          <% }%>
                                       </tbody>
                                       <tfoot>
                                       <tr>
                                            <th>Mã góp ý</th>
                                            <th>Người gửi</th>
                                            <th>Email</th>
                                            <th>Nội dung</th>
                                            <th>Ngày nhận</th>
                                            <th>Xử lý</th>  
                                            <th>Tùy chọn</th> 
                                       </tr>
                                       </tfoot>
                                     </table>
                                   </div>
                                   <!-- /.box-body -->
                                 </div>
                                 <!-- /.box -->
                               </div>
                               <!-- /.col -->
                             </div>
                             <!-- /.row -->
                           </section>

<!--                /MAIN------------------------------------------------------------------->
            </div>            
            <jsp:include page="./layout/footer.jsp"></jsp:include>
            <jsp:include page="./layout/control-sidebar.jsp"></jsp:include>
            <div class="control-sidebar-bg"></div>
        </div>
            <script src="${root}/Admin/layout/plugins/jQuery/jquery-2.2.3.min.js"></script>
            <script src="${root}/Admin/layout/bootstrap/js/bootstrap.min.js"></script>
            <script src="${root}/Admin/layout/plugins/datatables/jquery.dataTables.min.js"></script>
            <script src="${root}/Admin/layout/plugins/datatables/dataTables.bootstrap.min.js"></script>
            <script src="${root}/Admin/layout/plugins/slimScroll/jquery.slimscroll.min.js"></script>
            <script src="${root}/Admin/layout/plugins/fastclick/fastclick.js"></script>
            <script src="${root}/Admin/layout/dist/js/app.min.js"></script>
            <script src="${root}/Admin/layout/dist/js/demo.js"></script>
            <script>
            $(document).ready(function () {
                $('#example1').DataTable({
                    responsive: true
                });
            });
            </script>
            <script type="text/javascript">
            $(function(){
                    $('.sidebar-menu a').filter(function(){return this.href===location.href;}).parent().addClass('active').siblings().removeClass('active');
                    $('.sidebar-menu a').click(function(){
                            $(this).parent().addClass('active').siblings().removeClass('active');	
                    });
            });
            </script>
        
    </body>
</html>
