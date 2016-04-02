using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace practica3_bd1.Code
{
    public class Validacion
    {
        public static bool validar_sesion(Sesion n, string pagina)
        {
            string tmp = n.Tipo.ToLower();

           

            switch (tmp)
            {
                case "1":
                    switch (pagina)
                    {
                        //Empleado tiene acceso a todas las paginas y todas las funciones
                        case "Administrativo":
                        case "Unidades":
                            return true;
                        default:
                            return false;
                    }
                case "2":
                    switch (pagina)
                    {
                        //Estudiante
                        case "NotasEstudiante":
                        case "CursosEstudiante":
                        case "AsignacionCursos":
                        case "CatedraticosCurso":
                        case "Estudiante":
                            return true;
                        default:
                            return false;
                    }

                case "3":
                    switch (pagina)
                    {
                        //CAtedratico
                        case "Profesor":
                            return true;
                        default:
                            return false;
                    }

            }

            return false;   //si algun usuario con un rol no definido no tiene ningun permiso
        }
    }
}