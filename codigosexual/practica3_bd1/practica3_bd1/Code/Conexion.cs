using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

using MySql.Data;
using MySql.Data.MySqlClient;
using System.Data.SqlClient;


namespace practica3_bd1.Code
{
    public class Conexion
    {
        private MySqlConnection conn = new MySqlConnection();





        public int Entrar(string user, string password)
        {
            int resultado = 0;
            if (ConectarMysql())
            {
                String nombreproc = "Login";
                MySqlCommand cmd = new MySqlCommand(nombreproc, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@User", Int32.Parse(user));
                cmd.Parameters.AddWithValue("@Pass", password);


                resultado = Int32.Parse(cmd.ExecuteScalar().ToString());
                Console.WriteLine("Connecting to MySQL...");
                cerrarmysql();
                return resultado;

            }
            else {
                return resultado;
            }

        }

        private bool ConectarMysql(){
            bool ret = false;
            String connStr = "server=localhost;user=root;database=centrodecalculo;port=3306;password=1234;";
            try 
            {
                conn.ConnectionString = connStr;
                conn.Open();
                ret = true;
            }
            catch (Exception ex) 
            {
                ret = false;
            }
            return ret;
        }
        private void cerrarmysql() { conn.Close(); }

        public DataSet Mostrar(string nombreproc)
        {
            DataSet data = new DataSet();
            try
            {

                MySqlDataAdapter adaptador = new MySqlDataAdapter(nombreproc, conn);
                adaptador.SelectCommand.CommandType = CommandType.StoredProcedure;
                if (ConectarMysql())
                {
                    adaptador.Fill(data);
                }

            }
            catch (Exception ex)
            {

            }
            finally 
            {
                cerrarmysql();
            }
            return data;
        }

        public int Insertar(string nombreproc,string param) 
        {
            return 0;
        }


    }



}