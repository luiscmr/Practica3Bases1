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

    
        <!-- MODAL -->
        <input runat="server" type="text" required="required" readonly="readonly" name="codigo" id="codigo"  style="visibility:hidden; height:5px;"/>
        <div id="Modal" runat="server">

        </div>

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Unidades Administrativas</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>

        <div class="row">
            <button type="button" class="btn btn-success" id="Add">Agregar Unidad Administrativa</button>
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

    <script type="text/javascript">

        $("#Add").on('click', function () {

            $.ajax({
                type: 'POST',
                url: 'Unidades.aspx/MostrarModal',
                data: JSON.stringify({ id: "" }),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (response) {
                    //se escribe el modal
                    var $modal = $('#cuerpo_Modal');
                    $modal.html(response.d);
                    $('#Modal').on('show.bs.modal', function () {
                        $('.modal .modal-body').css('overflow-y', 'auto');
                        $('.modal .modal-body').css('max-height', $(window).height() * 0.7);
                        $('.modal .modal-body').css('height', $(window).height() * 0.7);
                    });
                    $("#Editar").hide();
                    $("#Guardar").show();
                    $('#Modal').modal({ //
                        show: true, //mostramos el modal registra producto
                        backdrop: 'static' //hace que no se cierre el modal si le dan clic afuera del mismo.
                    });
                    /*
                    //MUESTRA EL MODAL PARA AGREGAR USUARIO
                    FillCombo();
                    $('#formulario-usuario')[0].reset(); //formulario lo inicializa con datos vacios
                    $('#edi').hide(); //escondemos el boton de edicion porque es un nuevo registro
                    $('#reg').show(); //mostramos el boton de registro
                    $('#editar-usuario').modal({ //
                        show: true, //mostramos el modal registra producto
                        backdrop: 'static' //hace que no se cierre el modal si le dan clic afuera del mismo.
                    });
                    */
                }
            });

        });

        function Guardar() {
            var Nombre = document.getElementById("Nombre").value;
            var Fundacion = document.getElementById("Fundacion").value;
            var Inicio = document.getElementById("Inicio").value;
            var Cierre = document.getElementById("Cierre").value;
            var Salon = document.getElementById("Salon").value;
            var Edificio = document.getElementById("Edificio").value;

            if (Nombre != "" && Fundacion != "" && Inicio != "" && Cierre != "" && Salon != "" && Edificio != "")
            {
                $.ajax({
                    type: 'POST',
                    url: 'Unidades.aspx/Add',
                    data: JSON.stringify({ Nombre: Nombre, Fundacion: Fundacion, Inicio: Inicio, Cierre: Cierre, Salon: Salon, Edificio: Edificio }),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (response) {
                        
                        if (response.d == 1) {
                            $('#mensaje').removeClass();
                            $('#mensaje').addClass('alert alert-success alert-dismissable').html('Unidad agregada con exito').show(200).delay(5500).hide(200);
                            $('#formulario')[0].reset();
                            reloadTable();
                        }else if(response.d == 0 || response.d == -1){
                            $('#mensaje').removeClass();
                            $('#mensaje').addClass('alert alert-danger alert-dismissable').html('No se pudo registrar la Unidad').show(200).delay(5500).hide(200);
                        }

                    }
                });

            } else
            {
                $('#mensaje').removeClass();
                $('#mensaje').addClass('alert alert-danger alert-dismissable').html('No deje campos obligatorios (*) vacios').show(200).delay(2500).hide(200);
            }

        }

        function Eliminar() {

        }

        function Mostrar(id){

            document.getElementById("<% = codigo.ClientID%>").value = id;
            var identi = document.getElementById("<% = codigo.ClientID%>").value;

            $.ajax({
                type: 'POST',
                url: 'Unidades.aspx/MostrarModal',
                data: JSON.stringify({ id: identi }),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (response) {
                    //se escribe el modal
                    var $modal = $('#cuerpo_Modal');
                    $modal.html(response.d);
                    $('#Modal').on('show.bs.modal', function () {
                        $('.modal .modal-body').css('overflow-y', 'auto');
                        $('.modal .modal-body').css('max-height', $(window).height() * 0.7);
                        $('.modal .modal-body').css('height', $(window).height() * 0.7);
                    });
                    $("#Editar").show();
                    $("#Guardar").hide();
                    $('#Modal').modal({ //
                        show: true, //mostramos el modal registra producto
                        backdrop: 'static' //hace que no se cierre el modal si le dan clic afuera del mismo.
                    });
                    $.ajax({
                        type: 'POST',
                        url: 'Unidades.aspx/Buscar',
                        data: JSON.stringify({ id: identi }),
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        success: function (response) {
                            var datos = JSON.parse(response.d);
                            var Codigo = datos[0];
                            var Nombre = datos[1];
                            var tfun = ""+datos[2];
                            var Fundacion = tfun.split("T",1);
                            var Salon = datos[5];
                            var Edificio = datos[6];
                            
                            var ap = "" + datos[3];
                            var ap1 = ap.split("T");
                            var h = ap1[1].split("H");
                            var hh = "" + h[0];
                            if (hh.length == 1) { hh = "0" + hh; }
                            var m = "00";
                            if (h[1] != "") {
                                m = h[1].split("M",1);
                            }
                            
                            var Apertura = hh + ":" + m;

                            ap = "";
                            ap1 = "";
                            h = "";
                            hh = "";
                            m = "";
                            ap = "" + datos[4];
                            ap1 = ap.split("T");
                            h = ap1[1].split("H");
                            hh = "" + h[0];
                            if (hh.length == 1) { hh = "0" + hh; }
                            m = "00";
                            if (h[1] != "") {
                                m = h[1].split("M", 1);
                            }

                            var Cierre = hh + ":" + m;



                            document.getElementById("<% = codigo.ClientID%>").value = Codigo;

                            document.getElementById("Nombre").value = Nombre;
                            document.getElementById("Fundacion").value = Fundacion;
                            document.getElementById("Inicio").value = Apertura;
                            document.getElementById("Cierre").value = Cierre;
                            document.getElementById("Salon").value = Salon;
                            document.getElementById("Edificio").value = Edificio;

                        }
                    });
                }
            });


        }

        function Editar() {

            var Nombre = document.getElementById("Nombre").value;
            var Fundacion = document.getElementById("Fundacion").value;
            var Inicio = document.getElementById("Inicio").value;
            var Cierre = document.getElementById("Cierre").value;
            var Salon = document.getElementById("Salon").value;
            var Edificio = document.getElementById("Edificio").value;
            var id = document.getElementById("<%=codigo.ClientID%>").value;

            if (Nombre != "" && Fundacion != "" && Inicio != "" && Cierre != "" && Salon != "" && Edificio != "") {
                $.ajax({
                    type: 'POST',
                    url: 'Unidades.aspx/Edit',
                    data: JSON.stringify({Codigo: id, Nombre: Nombre, Fundacion: Fundacion, Inicio: Inicio, Cierre: Cierre, Salon: Salon, Edificio: Edificio }),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (response) {

                        if (response.d == 1) {
                            $('#mensaje').removeClass();
                            $('#mensaje').addClass('alert alert-success alert-dismissable').html('Unidad agregada con exito').show(200).delay(5500).hide(200);
                            $('#formulario')[0].reset();
                            reloadTable();
                        } else if (response.d == 0 || response.d == -1) {
                            $('#mensaje').removeClass();
                            $('#mensaje').addClass('alert alert-danger alert-dismissable').html('No se pudo registrar la Unidad').show(200).delay(5500).hide(200);
                        }

                    }
                });

            } else {
                $('#mensaje').removeClass();
                $('#mensaje').addClass('alert alert-danger alert-dismissable').html('No deje campos obligatorios (*) vacios').show(200).delay(2500).hide(200);
            }

        }

        function Eliminar(id)
        {
            if (confirm("Esta seguro que desea eliminar la unidad?")) {
                $.ajax({
                    type: "POST",
                    url: "Unidades.aspx/Delete",
                    data: JSON.stringify({ id: id }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d == 0) {
                            alert("Unidad Eliminado Exitosamente");
                            reloadTable();
                        } else {
                            alert("La Unidad No Pudo Ser Eliminado");
                        }
                    }
                });
            }
        }

        function reloadTable() {

            window.location.reload();

        }

    </script>

    <!-- jQuery -->
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>


</asp:Content>
