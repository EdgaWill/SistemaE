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
    public partial class Evaluacion : System.Web.UI.Page
    {
               

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] != null)
            {
                lblWelcome.Text = "Hola, " + Session["Usuario"].ToString();
            }
            else
            {
                Response.Redirect("Evaluacion.aspx");
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear(); // Limpia la sesión
            Session.Abandon(); // Finaliza la sesión
            Response.Redirect("Login.aspx"); // Redirige al login
        }

        //protected void btnBuscar_Click(object sender, EventArgs e)
        //{

        //string dni = txtDNI.Text.Trim();

        //if (!string.IsNullOrEmpty(dni))
        //{
        //    string cadena = ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString;

        //    using (SqlConnection con = new SqlConnection(cadena))
        //    {
        //        SqlCommand cmd = new SqlCommand("sp_ObtenerEvaluadorPorDNI", con);
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.Parameters.AddWithValue("@Dni", dni);

        //        con.Open();
        //        SqlDataReader reader = cmd.ExecuteReader();

        //        if (reader.Read())
        //        {
        //            txtNombresyApellidos.Text = reader["NombresyApellidos"].ToString();
        //            txtCargo.Text = reader["Cargo"].ToString();
        //            txtArea.Text = reader["Area"].ToString();
        //            txtGrado.Text = reader["Grado"].ToString();
        //        }
        //        else
        //        {
        //            txtNombresyApellidos.Text = "";
        //            txtCargo.Text = "";
        //            txtArea.Text = "";
        //            txtGrado.Text = "";
        //            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('DNI no encontrado.');", true);
        //        }

        //        reader.Close();
        //    }
        //}
        //}


        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string dni = txtDNI.Text.Trim();

            if (!string.IsNullOrEmpty(dni))
            {
                string cadena = ConfigurationManager.ConnectionStrings["ConexionSQL"].ConnectionString;

                using (SqlConnection con = new SqlConnection(cadena))
                {
                    SqlCommand cmd = new SqlCommand("sp_ObtenerEvaluadorPorDNI", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Dni", dni);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet dsevalua = new DataSet();

                    try
                    {
                        da.Fill(dsevalua);

                        // Tabla 0: Datos del evaluador
                        if (dsevalua.Tables.Count > 0 && dsevalua.Tables[0].Rows.Count > 0)
                        {
                            DataRow row = dsevalua.Tables[0].Rows[0];

                            txtNombresyApellidos.Text = row["NombresyApellidos"].ToString();
                            txtCargo.Text = row["Cargo"].ToString();
                            txtArea.Text = row["Area"].ToString();
                            txtGrado.Text = row["Grado"].ToString();
                        }
                        else
                        {
                            txtNombresyApellidos.Text = "";
                            txtCargo.Text = "";
                            txtArea.Text = "";
                            txtGrado.Text = "";
                            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Evaluador no encontrado.');", true);
                        }

                        // Tabla 1: Datos de los evaluados para el GridView
                        if (dsevalua.Tables.Count > 1 && dsevalua.Tables[1].Rows.Count > 0)
                        {
                            gvEvaluadosdetail.DataSource = dsevalua.Tables[1];
                            gvEvaluadosdetail.DataBind();
                        }
                        else
                        {
                            gvEvaluadosdetail.DataSource = null;
                            gvEvaluadosdetail.DataBind();
                        }

                        Session["dsevalua"] = dsevalua;
                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "alert", $"alert('Error: {ex.Message}');", true);
                    }
                }
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            txtDNI.Text = "";
            txtNombresyApellidos.Text = "";
            txtCargo.Text = "";
            txtArea.Text = "";
            txtGrado.Text = "";


            this.gvEvaluadosdetail.DataSource = null;
            this.gvEvaluadosdetail.DataBind();

        }

        protected void chkSeleccionar_CheckedChanged(object sender, EventArgs e)
        {

            CheckBox chkSeleccionado = (CheckBox)sender;
            GridViewRow filaSeleccionada = (GridViewRow)chkSeleccionado.NamingContainer;

            foreach (GridViewRow fila in gvEvaluadosdetail.Rows)
            {
                CheckBox chk = (CheckBox)fila.FindControl("chkSeleccionar");

                if (chk != chkSeleccionado)
                //if (chk != null && fila != filaSeleccionada)
                {
                    chk.Checked = false; 
                    fila.BackColor = System.Drawing.Color.White;
                }
            }

            // Si está marcado, aplica color
            if (chkSeleccionado.Checked)
            {
                filaSeleccionada.BackColor = System.Drawing.Color.LightGreen;
            }
            else
            {
                filaSeleccionada.BackColor = System.Drawing.Color.White;
            }
        }

        protected void btnobjetivos_Click(object sender, EventArgs e)
        {
            bool encontrado = false;

            DataSet dsevalua = (DataSet)Session["dsevalua"];

            if (dsevalua != null && dsevalua.Tables.Count > 0)
            {
                DataTable dt = dsevalua.Tables[1];

                foreach (GridViewRow fila in gvEvaluadosdetail.Rows)
                {
                    CheckBox chk = (CheckBox)fila.FindControl("chkSeleccionar");
                    if (chk != null && chk.Checked)
                    {
                        string dni = fila.Cells[3].Text.Trim();

                        DataRow[] resultado = dt.Select("DNI_Evaluado = '" + dni + "'");

                        if (resultado.Length > 0)
                        {
                            txtmdni.Text = resultado[0]["DNI_Evaluado"].ToString();
                            txtmnombresyapellidos.Text = resultado[0]["NombresyApellidos"].ToString();
                            txtmcargo.Text = resultado[0]["Cargo_Estructural"].ToString();
                            txtmarea.Text = resultado[0]["Area"].ToString();

                            ScriptManager.RegisterStartupScript(this, this.GetType(), "abrirModal", "$('#PanelModal').modal('show');", true);
                            encontrado = true;
                            break;

                        }
                        //TextBox1.Text = fila.Cells[3].Text;
                        //txtNombre.Text = fila.Cells[5].Text;
                        //TextBox2.Text = fila.Cells[6].Text;

                        
                    }
                }

            }
                
            if (!encontrado)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alerta", "alert('Debe seleccionar un evaluado.');", true);
            }
        }
        

        protected void gvEvaluadosdetail_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
    }
}