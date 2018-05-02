using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            try
            {
                servererror.Visible = false;

                con.Open();
                cmd.Connection = con;
                cmd.CommandText = @"SELECT UserID FROM Users WHERE Username = @uname AND
                                  Password = @Password";
                cmd.Parameters.AddWithValue("@uname", txtUName.Text);
                cmd.Parameters.AddWithValue("@Password", Helper.CreateSHAHash(txtPassword.Text));
                using (SqlDataReader data = cmd.ExecuteReader())
                {
                    if (data.HasRows)
                    {
                        while (data.Read())
                        {
                            Session["userid"] = data["UserID"].ToString();
                        }

                        Response.Redirect("Default.aspx");
                    }
                    else
                    {
                        loginerror.Visible = true;
                    }
                }
            }
            catch
            {
                servererror.Visible = true;
            }
        }
    }
}