using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace SistemaRRHH
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string usuario = txtUser.Text.Trim();
            string clave = txtPass.Text.Trim();

            string cs = ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("sp_ValidarUsuario", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Username", usuario);
                cmd.Parameters.AddWithValue("@Password", clave);

                con.Open();
                int existe = (int)cmd.ExecuteScalar();

                if (existe > 0)
                {
                    Session["Usuario"] = usuario;
                    Response.Redirect("Evaluacion.aspx");
                }
                else
                {
                    lblMessage.Text = "Usuario o contraseña incorrectos";
                }
            }
        }
    }
}