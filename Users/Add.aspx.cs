using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Users_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_OnClick(object sender, EventArgs e)
    {
        using (var con = new SqlConnection(Helper.GetCon()))
        using (var cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = @"INSERT INTO Clients
                            (FirstName, LastName, UserPic,  Birthday, EmailAdd,
                            MobileNo, Address, Status, DateAdded) VALUES
                            (@fn, @ln, @userpic, @bday, @email, @mobile, @addr, @status, @dadded)";
            cmd.Parameters.AddWithValue("@fn", txtFN.Text);
            cmd.Parameters.AddWithValue("@ln", txtLN.Text);

            if (!usrPicUpload.HasFile)
            {
                cmd.Parameters.AddWithValue("@userpic", "placeholder.jpg");
            }
            else
            {
                string fileExt = Path.GetExtension(usrPicUpload.FileName);
                string id = Guid.NewGuid().ToString();
                cmd.Parameters.AddWithValue("@userpic", id + fileExt);
                usrPicUpload.SaveAs(Server.MapPath("~/clientpics/" + id + fileExt));
            }

            cmd.Parameters.AddWithValue("@bday", txtBday.Text);
            cmd.Parameters.AddWithValue("@email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@mobile", txtMobile.Text);
            cmd.Parameters.AddWithValue("@addr", txtAddr.Text);
            cmd.Parameters.AddWithValue("@status", ddlStatus.SelectedValue);
            cmd.Parameters.AddWithValue("@dadded", Helper.PHTime());
            cmd.ExecuteNonQuery();

            Response.Redirect("View.aspx");
        }
    }
}