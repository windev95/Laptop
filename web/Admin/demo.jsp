<%-- 
    Document   : demo
    Created on : Dec 31, 2016, 7:54:36 PM
    Author     : Toan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DEMO</title>
        <link rel="icon" href="./images/favicon.png" type="image/x-icon" />
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.6 -->
        <link rel="stylesheet" href="${root}/Admin/layout/bootstrap/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <!-- DataTables -->
        <link rel="stylesheet" href="${root}/Admin/layout/plugins/datatables/dataTables.bootstrap.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="${root}/Admin/layout/dist/css/AdminLTE.min.css">
        <!-- AdminLTE Skins. Choose a skin from the css/skins
             folder instead of downloading all of them to reduce the load. -->
        <link rel="stylesheet" href="${root}/Admin/layout/dist/css/skins/_all-skins.min.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body  class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <jsp:include page="./layout/header.jsp"></jsp:include>
            <div class="content-wrapper">
                <section class="content-header">
                    <h1>
                      Dashboard
                      <small>Version 2.0</small>
                    </h1>
                    <ol class="breadcrumb">
                      <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                      <li class="active">Dashboard</li>
                    </ol>
                  </section>
<!--                MAIN------------------------------------------------------------------->
                

                        <section class="content">
                             <div class="row">
                               <div class="col-xs-12">

                                 <div class="box">
                                   <div class="box-header">
                                     <h3 class="box-title">Data Table With Full Features</h3>
                                      <a class="btn btn-primary mini_btn center-block" href="../Admin/insert_category.jsp">THÊM MỚI</a>
                                   </div>
                                   <!-- /.box-header -->
                                   <div class="box-body">
                                     <table id="example1" class="table table-bordered table-striped">
                                       <thead>
                                       <tr>
                                         <th>Rendering engine</th>
                                         <th>Browser</th>
                                         <th>Platform(s)</th>
                                         <th>Engine version</th>
                                         <th>CSS grade</th>
                                       </tr>
                                       </thead>
                                       <tbody>                                      
                                       
                                       <tr>
                                         <td>KHTML</td>
                                         <td>Konqureror 3.1</td>
                                         <td>KDE 3.1</td>
                                         <td>3.1</td>
                                         <td>C</td>
                                       </tr>
                                       <tr>
                                         <td>KHTML</td>
                                         <td>Konqureror 3.3</td>
                                         <td>KDE 3.3</td>
                                         <td>3.3</td>
                                         <td>A</td>
                                       </tr>
                                       <tr>
                                         <td>KHTML</td>
                                         <td>Konqureror 3.5</td>
                                         <td>KDE 3.5</td>
                                         <td>3.5</td>
                                         <td>A</td>
                                       </tr>
                                       <tr>
                                         <td>Tasman</td>
                                         <td>Internet Explorer 4.5</td>
                                         <td>Mac OS 8-9</td>
                                         <td>-</td>
                                         <td>X</td>
                                       </tr>
                                       <tr>
                                         <td>Tasman</td>
                                         <td>Internet Explorer 5.1</td>
                                         <td>Mac OS 7.6-9</td>
                                         <td>1</td>
                                         <td>C</td>
                                       </tr>
                                       <tr>
                                         <td>Tasman</td>
                                         <td>Internet Explorer 5.2</td>
                                         <td>Mac OS 8-X</td>
                                         <td>1</td>
                                         <td>C</td>
                                       </tr>
                                       <tr>
                                         <td>Misc</td>
                                         <td>NetFront 3.1</td>
                                         <td>Embedded devices</td>
                                         <td>-</td>
                                         <td>C</td>
                                       </tr>
                                       <tr>
                                         <td>Misc</td>
                                         <td>NetFront 3.4</td>
                                         <td>Embedded devices</td>
                                         <td>-</td>
                                         <td>A</td>
                                       </tr>
                                       <tr>
                                         <td>Misc</td>
                                         <td>Dillo 0.8</td>
                                         <td>Embedded devices</td>
                                         <td>-</td>
                                         <td>X</td>
                                       </tr>
                                       <tr>
                                         <td>Misc</td>
                                         <td>Links</td>
                                         <td>Text only</td>
                                         <td>-</td>
                                         <td>X</td>
                                       </tr>
                                       <tr>
                                         <td>Misc</td>
                                         <td>Lynx</td>
                                         <td>Text only</td>
                                         <td>-</td>
                                         <td>X</td>
                                       </tr>
                                       <tr>
                                         <td>Misc</td>
                                         <td>IE Mobile</td>
                                         <td>Windows Mobile 6</td>
                                         <td>-</td>
                                         <td>C</td>
                                       </tr>
                                       <tr>
                                         <td>Misc</td>
                                         <td>PSP browser</td>
                                         <td>PSP</td>
                                         <td>-</td>
                                         <td>C</td>
                                       </tr>
                                       <tr>
                                         <td>Other browsers</td>
                                         <td>All others</td>
                                         <td>-</td>
                                         <td>-</td>
                                         <td>U</td>
                                       </tr>
                                       </tbody>
                                       <tfoot>
                                       <tr>
                                         <th>Rendering engine</th>
                                         <th>Browser</th>
                                         <th>Platform(s)</th>
                                         <th>Engine version</th>
                                         <th>CSS grade</th>
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
            <!-- jQuery 2.2.3 -->
            <script src="${root}/Admin/layout/plugins/jQuery/jquery-2.2.3.min.js"></script>
            <!-- Bootstrap 3.3.6 -->
            <script src="${root}/Admin/layout/bootstrap/js/bootstrap.min.js"></script>
            <!-- DataTables -->
            <script src="${root}/Admin/layout/plugins/datatables/jquery.dataTables.min.js"></script>
            <script src="${root}/Admin/layout/plugins/datatables/dataTables.bootstrap.min.js"></script>
            <!-- SlimScroll -->
            <script src="${root}/Admin/layout/plugins/slimScroll/jquery.slimscroll.min.js"></script>
            <!-- FastClick -->
            <script src="${root}/Admin/layout/plugins/fastclick/fastclick.js"></script>
            <!-- AdminLTE App -->
            <script src="${root}/Admin/layout/dist/js/app.min.js"></script>
            <!-- AdminLTE for demo purposes -->
            <script src="${root}/Admin/layout/dist/js/demo.js"></script>
            
            <script>
            $(function () {
              $("#example1").DataTable();
              $('#example2').DataTable({
                "paging": true,
                "lengthChange": false,
                "searching": false,
                "ordering": true,
                "info": true,
                "autoWidth": false
              });
            });
          </script>
    </body>
</html>
