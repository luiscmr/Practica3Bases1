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
        private static String connStr = "server=localhost;user=root;database=centrodecalculo;port=3306;password=1234;";
        private MySqlConnection conn = new MySqlConnection(connStr);

        private MySqlDataReader rdr;



        public int Entrar(string user, string password)
        {
            int resultado = 0;
            ConectarMysql();
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

        private void ConectarMysql(){
            conn.Open();
        }
        private void cerrarmysql() { conn.Close(); }

        public MySqlDataReader Mostrar(string nombreproc, string campos)
        {

            ConectarMysql();
            MySqlCommand cmd = new MySqlCommand(nombreproc, conn);
            cmd.CommandType = CommandType.StoredProcedure;
            rdr = cmd.ExecuteReader();
            cerrarmysql();
            return rdr;

        }




    }



}