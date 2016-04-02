using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using MySql.Data;
using MySql.Data.MySqlClient;
using System.Data;
using System.Web.Services;
using System.Xml;

namespace practica3_bd1.Code
{
    public partial class Unidades : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Usuario"] != null)
                {
                    if (!Validacion.validar_sesion((Sesion)Session["Usuario"], "Unidades"))
                    {
                        Response.Redirect("~/Index.aspx");
                    }
                }
                else
                {
                    Response.Redirect("~/Index.aspx");
                }


            }

            tabla.InnerHtml = GenerarTabla();
        }

        private string GenerarTabla() {
            string innerHTML = "";

            Conexion conexion = new Conexion();

            DataSet ds = conexion.Mostrar("VerUnidadesAmin");

            string data = "No hay datos disponibles para mostrar ahora";

            if (ds.Tables.Count > 0)
            {
                data = "<div class=\"table-responsive\"> \n" +
                                "<table class=\"table\" id=\"dataTables-example\"> \n" +
                                "<thead><tr>\n" +
                                    "<th>Nombre</th>\n" +
                                    "<th>Fecha De Fundacion</th>\n" +
                                    "<th>Horario de Apertura</th>\n" +
                                    "<th>Horario de Cierre</th>\n" +
                                    "<th>Salon</th>\n" +
                                    "<th>Edificio</th>\n" +
                                    "<th>Acciones</th>\n" +
                                "</tr></thead>\n" +
                                "<tbody> \n";
                foreach (DataRow item in ds.Tables[0].Rows)
                {
                    data += "<tr>";
                    data +=
                        "<th>" + item["Nombre"].ToString() + "</th>\n" +
                        "<th>" + item["Fundacion"].ToString() + "</th>\n" +
                        "<th>" + item["Apertura"].ToString() + "</th>\n" +
                        "<th>" + item["Cierre"].ToString() + "</th>\n" +
                        "<th>" + item["Salon_Salon"].ToString() + "</th>\n" +
                        "<th>" + item["Salon_Edificio"].ToString() + "</th>\n" +
                        "<th> <a href=\"javascript:Mostrar(" + item["Codigo"].ToString() + ")\"><p  class=\"fa fa-pencil\"></p></a> <a href=\"javascript:Eliminar(" + item["Codigo"].ToString() + ")\"><p  class=\"fa fa-times\"></p></a> </th>\n"
                        ;
                    data += "</tr>";
                }
                data += "</tbody>";
            }
            innerHTML = data;
            return innerHTML;
        }

        [WebMethod]

        public static string MostrarModal() {
            //head
            string cadena = "<div class=\"modal fade\" id=\"Modal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"myModalLabel\" aria-hidden=\"true\"> \n" +
                            "<div class=\"modal-dialog\">" +
                            "<div class=\"modal-content\"> \n" +
                            "<div class=\"modal-header\"> \n" +
                            "<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">&times;</button> \n" +
                            "<h4 class=\"modal-title\" id=\"myModalLabel\">Modal title</h4> \n" +
                            "</div> \n" +
                            "<div class=\"modal-body\"> \n";
            //body
            cadena += "<div class=\"col-lg-10\"> \n"+
                        "<form role=\"form\" id=\"formulario\"> \n" +

                        "<div class=\"form-group\"> \n"+
                        "<label>* Nombre</label> \n"+
                        "<input id=\"Nombre\" class=\"form-control\" required=\"required\">\n"+
                        //"<p class=\"help-block\">Example block-level help text here.</p>\n"+
                        "</div> \n"+

                        "<div class=\"form-group\"> \n" +
                        "<label>* Fecha de Fundacion</label> \n" +
                        "<input id=\"Fundacion\" type=\"date\" class=\"form-control\">\n" +
                //"<p class=\"help-block\">Example block-level help text here.</p>\n"+
                        "</div> \n" +

                        "<div class=\"form-group\"> \n" +
                        "<label>* Inicio de Atencion al Cliente</label> \n" +
                        "<input id=\"Inicio\" type=\"time\" class=\"form-control\">\n" +
                //"<p class=\"help-block\">Example block-level help text here.</p>\n"+

                        "<div class=\"form-group\"> \n" +
                        "<label>* Cierre de Atencion al Cliente</label> \n" +
                        "<input id=\"Cierre\" type=\"time\" class=\"form-control\">\n" +
                //"<p class=\"help-block\">Example block-level help text here.</p>\n"+
                        "</div> \n" + "</div> \n" +

                        "<div class=\"form-group\"> \n" +
                        "<label>* Salon</label> \n" +
                        "<input id=\"Salon\" type=\"number\" class=\"form-control\">\n" +
                //"<p class=\"help-block\">Example block-level help text here.</p>\n"+
                        "</div> \n" +

                        "<div class=\"form-group\"> \n" +
                        "<label>* Edificio</label> \n" +
                        "<input id=\"Edificio\" type=\"text\" class=\"form-control\">\n" +
                //"<p class=\"help-block\">Example block-level help text here.</p>\n"+
                        "</div> \n" +

                        "</form>" +
                        "</div>";
            //foot
            cadena +="</div> \n"+
                        "<div class=\"modal-footer\"> \n"+
                        "<div id=\"mensaje\"></div> \n"+
                        "<div class=\"alert alert-info alert-dismissable\"> \n" +
                        "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>\n"+
                        "Campos Obligatorios (*) \n"+
                        "</div> \n"+
                        "<button type=\"button\" onclick=\"reloadTable();\" id=\"Cerrar\" class=\"btn btn-default\" data-dismiss=\"modal\">Cerrar</button> \n" +
                        "<button type=\"button\" onclick=\"Guardar();\" id=\"Guardar\" class=\"btn btn-primary\">Guardar</button>\n" +
                        "<button type=\"button\" onclick=\"Editar();\" id=\"Editar\" class=\"btn btn-success\">Editar</button>\n" +
                        "</div> \n"+
                        "</div> \n"+
                        "</div> \n"+
                        "</div>";
            return cadena;
        }

        [WebMethod]

        public static int Add(string Nombre, string Fundacion, string Inicio, string Cierre, string Salon, string Edificio) 
        {


            int respuesta = 0;
            String connStr = "server=localhost;user=root;database=centrodecalculo;port=3306;password=1234;";
            MySqlConnection conn = new MySqlConnection();
            conn.ConnectionString = connStr;
            MySqlCommand cmd = new MySqlCommand("InsertarUnidadAdmin", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Nombre", Nombre);
            cmd.Parameters.AddWithValue("@Fundacion", Fundacion);
            cmd.Parameters.AddWithValue("@Apertura", Inicio);
            cmd.Parameters.AddWithValue("@Cierre", Cierre);
            cmd.Parameters.AddWithValue("@Salon", Int32.Parse(Salon));
            cmd.Parameters.AddWithValue("@Edificio", Edificio);
            cmd.Parameters.Add(new MySqlParameter("respuesta", respuesta));

            cmd.Parameters["respuesta"].Direction = ParameterDirection.Output;

            cmd.Connection.Open();

            cmd.ExecuteNonQuery();

            respuesta = (int)cmd.Parameters["respuesta"].Value;

            cmd.Connection.Close();

            return respuesta;

        }

        [WebMethod]

        public static string Buscar(string id) 
        { 
            string ret = "";

            Conexion conexion = new Conexion();

            //DataSet ds = conexion.Mostrar("BuscarUnidadAdmin");
            DataSet ds = new DataSet();

            String connStr = "server=localhost;user=root;database=centrodecalculo;port=3306;password=1234;";
            MySqlConnection conn = new MySqlConnection();
            conn.ConnectionString = connStr;
            string query = "call BuscarUnidadAdmin("+id+");";
            MySqlCommand cmd = new MySqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Codigo", Int32.Parse(id));

            MySqlDataAdapter adaptador = new MySqlDataAdapter(cmd);

            cmd.Connection.Open();

            adaptador.Fill(ds);

            XmlDocument xDoc = new XmlDocument();
            xDoc.LoadXml(ds.GetXml());

            XmlNodeList Cliente = xDoc.GetElementsByTagName("NewDataSet");
            XmlNodeList lista = ((XmlElement)Cliente[0]).GetElementsByTagName("Table");

            XmlNodeList Codigo = ((XmlElement)lista[0]).GetElementsByTagName("Codigo");
            XmlNodeList Nombre = ((XmlElement)lista[0]).GetElementsByTagName("Nombre");
            XmlNodeList Fundacion = ((XmlElement)lista[0]).GetElementsByTagName("Fundacion");
            XmlNodeList Apertura = ((XmlElement)lista[0]).GetElementsByTagName("Apertura");
            XmlNodeList Cierre = ((XmlElement)lista[0]).GetElementsByTagName("Cierre");
            XmlNodeList Salon = ((XmlElement)lista[0]).GetElementsByTagName("Salon_Salon");
            XmlNodeList Edificio = ((XmlElement)lista[0]).GetElementsByTagName("Salon_Edificio");

            cmd.Connection.Close();

            string[] datos = new string[7];
            datos[0] = Codigo[0].InnerText;
            datos[1] = Nombre[0].InnerText;
            datos[2] = Fundacion[0].InnerText;
            datos[3] = Apertura[0].InnerText;
            datos[4] = Cierre[0].InnerText;
            datos[5] = Salon[0].InnerText;
            datos[6] = Edificio[0].InnerText;

            ret = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(datos);
            return ret;
        }

        [WebMethod]

        public static int Edit(string Codigo,string Nombre, string Fundacion, string Inicio, string Cierre, string Salon, string Edificio) 
        {
            int ret = 0;

            String connStr = "server=localhost;user=root;database=centrodecalculo;port=3306;password=1234;";
            MySqlConnection conn = new MySqlConnection();
            conn.ConnectionString = connStr;
            MySqlCommand cmd = new MySqlCommand("ActualizarUnidadAdmin", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Nombre", Nombre);
            cmd.Parameters.AddWithValue("@Fundacion", Fundacion);
            cmd.Parameters.AddWithValue("@Apertura", Inicio);
            cmd.Parameters.AddWithValue("@Cierre", Cierre);
            cmd.Parameters.AddWithValue("@Salon", Int32.Parse(Salon));
            cmd.Parameters.AddWithValue("@Edificio", Edificio);
            cmd.Parameters.AddWithValue("@Codigo",Int32.Parse(Codigo));

            cmd.Parameters.Add(new MySqlParameter("respuesta", ret));

            cmd.Parameters["respuesta"].Direction = ParameterDirection.Output;

            cmd.Connection.Open();

            cmd.ExecuteNonQuery();

            ret = (int)cmd.Parameters["respuesta"].Value;

            cmd.Connection.Close();

            return ret;
        }

        [WebMethod]

        public static int Delete(string id) 
        {
            int ret = 0;

            String connStr = "server=localhost;user=root;database=centrodecalculo;port=3306;password=1234;";
            MySqlConnection conn = new MySqlConnection();
            conn.ConnectionString = connStr;
            MySqlCommand cmd = new MySqlCommand("EliminarUnidadAdmin", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Codigo", Int32.Parse(id));
            cmd.Parameters.Add(new MySqlParameter("respuesta", ret));

            cmd.Parameters["respuesta"].Direction = ParameterDirection.Output;

            cmd.Connection.Open();

            cmd.ExecuteNonQuery();

            ret = (int)cmd.Parameters["respuesta"].Value;

            cmd.Connection.Close();

            return ret;
        }
    }
}