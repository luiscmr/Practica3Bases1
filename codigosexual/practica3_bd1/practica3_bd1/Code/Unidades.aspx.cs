using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using MySql.Data;
using MySql.Data.MySqlClient;

namespace practica3_bd1.Code
{
    public partial class Unidades : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            tabla.InnerHtml = "<div class=\"table-responsive\"> \n" +
                                "<table class=\"table\" id=\"dataTables-example\"> \n"+
                                "<thead><tr>\n"+
                                    "<th>Nombre</th>\n"+
                                    "<th>Fecha De Fundacion</th>\n"+
                                    "<th>Horario de Apertura</th>\n"+
                                    "<th>Horario de Cierre</th>\n"+
                                    "<th>Salon</th>\n" +
                                    "<th>Edificio</th>\n" +
                                "</tr></thead>\n"+
                                "<tbody> \n" + GenerarTabla() + "</tbody>" ;
        }

        private string GenerarTabla() {
            string innerHTML = "";

            Conexion conexion = new Conexion();

            MySqlDataReader rdr = conexion.Mostrar("VerUnidadesAmin", "");

            while (rdr.Read()) {
                innerHTML += "<tr>";
                innerHTML += "<th>" + rdr["Nombre"] + "</th>\n" +
                             "<th>" + rdr["Fundacion"] + "</th>\n" +
                             "<th>" + rdr["Apertura"] + "</th>\n" +
                             "<th>" + rdr["Cierre"] + "</th>\n" +
                             "<th>" + rdr["Salon"] + "</th>\n" +
                             "<th>" + rdr["Edificio"] + "</th>\n";
                innerHTML =  "</tr>";
            }

            return innerHTML;
        }
    }
}