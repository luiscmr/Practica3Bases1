<%@ Page Title="" Language="C#" MasterPageFile="~/Code/Site1.Master" AutoEventWireup="true" CodeBehind="CursosEstudiante.aspx.cs" Inherits="practica3_bd1.Code.CursosEstudiante" %>
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
                <h1 class="page-header">Cursos Asignados</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>

        <!-- /.row -->

    </div>

    <div class="row">
            <div class="col-lg-13">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Cursos
                    </div>
                    <div class="panel-body">
                        
                            <div class="row show-grid">
                                <div class="col-md-8 col-md-offset-2"> 
                                    <div class="form-group">
                                        <label>Semestre</label>
                                        <select class="form-control" id="semestre" runat="server">
                                            <option value="1">Primer Semestre</option>
                                            <option value="2">Segundo Semestre</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Año</label>
                                        <select class="form-control" id="anio" runat="server">
                                            <option value="2010">2010</option>
                                            <option value="2011">2011</option>
                                            <option value="2012">2012</option>
                                            <option value="2013">2013</option>
                                            <option value="2014">2014</option>
                                            <option value="2015">2015</option>
                                            <option value="2016">2016</option>
                                        </select>
                                    </div>
                                    <button type="button" class="btn btn-success" id="View">Ver</button>
                                </div>
                            </div>
                        <div id="tabla" runat="server">

                        </div>
                    </div>
                <!-- /.col-lg-4 -->
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="pie" runat="server">

    <script type="text/javascript">

        $("View").on("click", function () {

            var anio = document.getElementById("anio").value;
            var semestre = document.getElementById("semestre").value;

            if (anio != "" && semestre != "")
            {

            }

        });

    </script>

</asp:Content>
