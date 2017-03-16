using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Videoclub.Datos;
using System.Data.SqlClient;
using System.Data;

namespace Videoclub
{
    public partial class Clientes : System.Web.UI.Page
    {
        cConexion c = new cConexion();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string Nombre = txtNombre.Text;
            string aPaterno = txtAPaterno.Text;
            string aMaterno = txtAMaterno.Text;
            string Suscripcion = txtsuscripción.Text;
            string Direccion = txtDirección.Text;
            string Telefono = txtTelefono.Text;
            int tel;      
            try
            {
                if (txtNombre.Text == "" || txtAPaterno.Text == "" || txtAMaterno.Text == "" || txtDirección.Text == "")
                {
                    lblStatus.Text = "Debe introducir todos los campos para continuar.";
                }
                else
                {
                    if (Telefono.Length == 10)
                    {                        
                        c.getConexion();
                        SqlCommand Guardar = new SqlCommand("INSERT INTO Clientes(Nombre, APaterno, AMaterno, Telefono, Direccion, Suscripcion, Recargos) VALUES ('" + Nombre + "','" + aPaterno + "','" + aMaterno + "','" + Telefono + "','" + Direccion + "', '" + Suscripcion + "','" + 0 + "')", c.con);
                        Guardar.ExecuteNonQuery();
                        lblStatus.Text = "Los datos del cliente se han guardado de manera correcta.";
                        c.CerrarConexion();
                        txtNombre.Text = string.Empty;
                        txtAPaterno.Text = string.Empty;
                        txtAMaterno.Text = string.Empty;
                        txtsuscripción.Text = string.Empty;
                        txtDirección.Text = string.Empty;
                        txtTelefono.Text = string.Empty;         
                    }
                    else
                    {
                        lblStatus.Text = "El número de telefono debe tener 10 digitos.";
                    }
                       
                }

                
            }
            catch (Exception ex)
            {
                lblStatus.Text = "Por favor verifica los datos que se ingresarón";
            }

        }
    }
}
