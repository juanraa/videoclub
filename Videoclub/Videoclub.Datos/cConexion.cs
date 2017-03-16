using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Videoclub.Datos
{
   public class cConexion
    {
       public SqlConnection con { get; set; }
        private string cadenaConexion()
        { 
            return "data source=Juanra; initial catalog=videoclub; user=sa; password=proisc"; 
        }
       //Obtener conexion
        public SqlConnection getConexion() {
            try
            {
                con = new SqlConnection(cadenaConexion());
                this.con.Open();
                return null; 
            }
            catch (Exception)
            {
                return null;
            }
        }
       //Metodo para cerrar conexion
        public void CerrarConexion()
        {
            if (this.con != null)
            {
                this.con.Close();
            }
        }

    }
}