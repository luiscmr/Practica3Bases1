<%@ Page Title="" Language="C#" MasterPageFile="~/Code/Site1.Master" AutoEventWireup="true" CodeBehind="Unidades.aspx.cs" Inherits="practica3_bd1.Code.Unidades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

       <!-- DataTables CSS -->
    <link href="../bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="../bower_components/datatables-responsive/css/dataTables.responsive.css" rel="stylesheet">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="navbarheader" runat="server">

    <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="Administrativo.aspx">Administrativo</a>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="menut" runat="server">

     <li><a href="Unidades.aspx"><i class="fa fa-book fa-fw"></i> Unidades Administrativas</a> </li>
     <li><a href="Unidades.aspx"><i class="fa fa-book fa-fw"></i> Empleados</a> </li>
     <li><a href="Unidades.aspx"><i class="fa fa-book fa-fw"></i> Puestos </a> </li>
     <li><a href="Unidades.aspx"><i class="fa fa-book fa-fw"></i> Cursos </a> </li>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cuerpo" runat="server">

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Unidades Administrativas</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>

        <div class="row">
            <button type="button" class="btn btn-success">Agregar Unidad Administrativa</button>
            <div class="col-lg-13">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Unidades Administrativas
                    </div>
                    <div class="panel-body">
                        <div id="tabla" runat="server">

                        </div>
                    </div>
                <!-- /.col-lg-4 -->
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="pie" runat="server">
</asp:Content>
