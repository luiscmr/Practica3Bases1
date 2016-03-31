<%@ Page Title="" Language="C#" MasterPageFile="~/Code/Site1.Master" AutoEventWireup="true" CodeBehind="Administrativo.aspx.cs" Inherits="practica3_bd1.Code.Administrativo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="navbarheader" runat="server">
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

<asp:Content ID="Content2" ContentPlaceHolderID="menut" runat="server">

 <li><a href="Unidades.aspx"><i class="fa fa-book fa-fw"></i> Unidades Administrativas</a> </li>
 <li><a href="Unidades.aspx"><i class="fa fa-book fa-fw"></i> Empleados</a> </li>
 <li><a href="Unidades.aspx"><i class="fa fa-book fa-fw"></i> Puestos </a> </li>
 <li><a href="Unidades.aspx"><i class="fa fa-book fa-fw"></i> Cursos </a> </li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cuerpo" runat="server">

    
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Bienvenido</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="pie" runat="server">
</asp:Content>
