using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Videoclub.Datos;
using System.Web.Services;
using System.Data.OleDb;

namespace Videoclub
{
    public partial class Rentar : System.Web.UI.Page
    {
        SqlConnection conexion = new SqlConnection("data source=Juanra; initial catalog=videoclub; user=sa; password=proisc");
        //cConexion c = new cConexion();
        protected void Page_Load(object sender, EventArgs e)
        {            
            DataSet ds = new DataSet();
            SqlDataReader dr;
            try
            {
                conexion.Open();
                SqlCommand cm = new SqlCommand("select Titulo from Peliculas WHERE Estado='Disponible'", conexion);
                SqlDataAdapter da = new SqlDataAdapter(cm);
                DataTable dt = new DataTable();
                dr = cm.ExecuteReader();
                while (dr.Read())
                {
                    DropDownList1.Items.Add(dr["Titulo"].ToString());
                }
                dr.Close();
                conexion.Close();
            }
            catch (Exception)
            { }


        }        

        protected void Button1_Click(object sender, EventArgs e)
        {
            string Categorias, Cliente, Recargos;
            Categorias = txtCategorias.Text;
            Cliente = txtCliente.Text;
            Recargos = txtRecargos.Text;
            int con;
            string recargo = string.Empty;
            SqlCommand dato = new SqlCommand("select Recargos from Clientes Where idCliente='" + Cliente + "'", conexion);
            conexion.Open();
            SqlDataReader reader = dato.ExecuteReader();
            if (reader.Read())
            {
                recargo = Convert.ToString(reader["Recargos"]);                
            }
            conexion.Close();
            con = int.Parse(recargo);
            int rec = int.Parse(Recargos);
            rec = con + rec;
            if (con > 5)
            {
                lblStatus.Text = "<script type = 'text/javascript'>alert('Excedio el número de peliculas rentadas, favor de pagar.');</script>";
                return;
            } 
            if (txtCategorias.Text == "" || txtCliente.Text == "" || txtRecargos.Text == "" )
            {
                lblStatus.Text = "Los campos deben de ser capturados.";                
            }
            else { 
            try
            {                
                SqlCommand Guardar = new SqlCommand("INSERT INTO Rentas(Titulos, Categorias, Cliente, Recargos) VALUES ('"+DropDownList1.SelectedValue+"','"+Categorias+"','"+Cliente+"','"+Recargos+"')", conexion);
                SqlCommand Modificar = new SqlCommand("UPDATE Peliculas SET Estado='Rentado' WHERE Titulo='"+DropDownList1.SelectedValue+"'", conexion);
                SqlCommand Cli = new SqlCommand("update Clientes set Recargos ='"+rec +"' where idCliente = '"+Cliente+"'",conexion);
                conexion.Open();
                    Guardar.ExecuteNonQuery();
                    Modificar.ExecuteNonQuery();
                    Cli.ExecuteNonQuery();
                    lblStatus.Text = "<script type = 'text/javascript'>alert('La renta se ha realizado correctamente.');</script>";
                    conexion.Close();
                    // txtTitulos.Text = string.Empty;
                    con = 0;
                    txtCategorias.Text = string.Empty;
                    txtCliente.Text = string.Empty;
                    txtRecargos.Text = string.Empty;
            }
            catch (Exception ex)
            {
                
                throw ex;
            }
        }
        }
    }
}