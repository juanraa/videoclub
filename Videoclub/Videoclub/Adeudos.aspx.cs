using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Videoclub.Datos; 

namespace Videoclub
{
    public partial class Adeudos : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            cConexion c = new cConexion();
            DataSet ds = new DataSet();
            try
            {
                c.getConexion();                                
                SqlDataAdapter cmd = new SqlDataAdapter("select idCliente as Cliente, Nombre as Nombre, APaterno as Apellido_Paterno, AMaterno as Apellido_Materno, Telefono as Telefono, Direccion as Dirección, Suscripción as Suscripción, Recargos as Recargos from Clientes WHERE Recargos>=1", c.con);
                cmd.Fill(ds, "Clientes");
                gvAdeudos.DataSource = ds.Tables["Clientes"];
                gvAdeudos.DataBind();
                c.CerrarConexion();                 
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}