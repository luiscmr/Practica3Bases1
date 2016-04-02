using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace practica3_bd1.Code
{
    public partial class CursosEstudiante : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]

        public static string Mostrar(string anio, string semestre) 
        {
            string ret = "";



            return ret;
        }
    }
}