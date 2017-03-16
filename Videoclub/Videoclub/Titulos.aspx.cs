using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using Videoclub.Datos;

namespace Videoclub
{
    public partial class Titulos : System.Web.UI.Page
    {
        SqlConnection conexion = new SqlConnection("data source=Juanra; initial catalog=videoclub; user=sa; password=proisc");
        cConexion c = new cConexion();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if (txtBuscar.Text == "")
            {
                Label2.Text = "El campo de titulo/género debe de estar capturado.";                
            }
            else
            {
                SqlDataAdapter da = new SqlDataAdapter("select Titulo, Genero, Estado from Peliculas WHERE Titulo='" + txtBuscar.Text + "' OR Genero='" + txtBuscar.Text + "'", conexion);
                DataSet ds = new DataSet();
                da.Fill(ds);
                gvTitulos.DataSource = ds;
                gvTitulos.DataBind();
                txtBuscar.Text = string.Empty;
            }            
        }
        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            string titulo, genero, Estado, Stock;
            titulo = txtTituloa.Text;
            genero = txtGeneroa.Text;
            Estado = txtEstadoa.Text;
            Stock = txtStock.Text;
            if (titulo == "" || genero == "" || Estado == "" || Stock == "")
            {
                string mensaje = "<script type = 'text/javascript'>alert('Todos los campos deben de ser llenados.');</script>";
            }
            else
            {
                SqlCommand Guardar = new SqlCommand("INSERT INTO Peliculas(Titulo, Genero, Estado, Stock) VALUES ('" + titulo + "','" + genero + "','" + Estado + "','" + Stock + "')", conexion);
                conexion.Open();
                Guardar.ExecuteNonQuery();
                string mensaje = "<script type = 'text/javascript'>alert('La pelicula se agrego correctamente.');</script>";
                conexion.Close();
                txtTituloa.Text = string.Empty;
                txtGeneroa.Text = string.Empty;
                txtEstadoa.Text = string.Empty;
                txtStock.Text = string.Empty;
            }
            
        }
    }
}