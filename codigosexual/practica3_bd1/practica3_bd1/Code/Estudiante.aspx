﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Code/Site1.Master" AutoEventWireup="true" CodeBehind="Estudiante.aspx.cs" Inherits="practica3_bd1.Code.Estudiante" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="navbarheader" runat="server">

     <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="Estudiante.aspx">Estudiante</a>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="menut" runat="server">

    <li><a href="AsignacionCursos.aspx"><i class="fa fa-book fa-fw"></i> Asignaciones de Cursos</a> </li>
     <li><a href="NotasEstudiante.aspx"><i class="fa fa-book fa-fw"></i> Notas</a> </li>
     <li><a href="CursosEstudiante.aspx"><i class="fa fa-book fa-fw"></i> Cursos </a> </li>
     <li><a href="CatedraticosCurso.aspx"><i class="fa fa-book fa-fw"></i> Catedraticos </a> </li>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cuerpo" runat="server">

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
<asp:Content ID="Content5" ContentPlaceHolderID="pie" runat="server">
</asp:Content>
