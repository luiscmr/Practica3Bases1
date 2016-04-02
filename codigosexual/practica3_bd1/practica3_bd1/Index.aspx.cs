using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using practica3_bd1.Code;
namespace practica3_bd1
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
        }
        
        [WebMethod]
        public static string Log(string usuario, string password)
        {

            Conexion conexion = new Conexion();

            if (conexion.Entrar(usuario, password) == 1)
            {
                return "1";

            }
            else { return "0";
            }

            
        }
    }
}