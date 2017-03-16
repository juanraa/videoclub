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
    public partial class Recibir : System.Web.UI.Page
    {
        SqlConnection conexion = new SqlConnection("data source=Juanra; initial catalog=videoclub; user=sa; password=proisc");
        //cConexion c = new cConexion(); 
        protected void Page_Load(object sender, EventArgs e)
        {
               DataSet ds = new DataSet();
                   try
                   {                       
                       conexion.Open();
                       SqlDataAdapter cmd = new SqlDataAdapter("select Titulo, Genero, Estado from Peliculas WHERE Estado='Rentado'", conexion);
                       cmd.Fill(ds, "Peliculas");
                       gvTitulos.DataSource = ds.Tables["Peliculas"];
                       gvTitulos.DataBind();
                       conexion.Close();
                   }
                   catch (Exception)
                   {

                       throw;
                   } 
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            string Cliente,Titulo, Estado;
            Titulo = txtTitulo.Text; 
            Estado = txtEstado.Text;
            Cliente = txtCliente.Text;
            string recargo = string.Empty;
            int con;     
            try
            {
                SqlCommand Modificar = new SqlCommand("UPDATE Peliculas SET Estado='"+Estado+"' WHERE Titulo='"+Titulo+"'", conexion);
                SqlCommand dato = new SqlCommand("select Recargos from Clientes Where idCliente='"+Cliente+"'", conexion);
                conexion.Open();
                SqlDataReader reader = dato.ExecuteReader();
                if (reader.Read())
                {
                    recargo = Convert.ToString(reader["Recargos"]);                    
                }
                conexion.Close();
                con = int.Parse(recargo);
                if (con > 0)
                {
                    con = con - 1;
                }                                
                SqlCommand Mod = new SqlCommand("update Clientes Set Recargos='"+con+"' WHERE idCliente='"+Cliente+"'", conexion);                
                conexion.Open();
                Modificar.ExecuteNonQuery();                
                Mod.ExecuteNonQuery();
                conexion.Close();
                con = 0;
                txtTitulo.Text = string.Empty;
                txtEstado.Text = string.Empty;
                txtCliente.Text = string.Empty;
            }
            catch (Exception)
            {
                
                throw;
            }
        }
        protected void gvTitulos_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            txtTitulo.Text = gvTitulos.SelectedRow.Cells[0].Text;
            txtEstado.Text = gvTitulos.SelectedRow.Cells[2].Text;
        }
    }
}