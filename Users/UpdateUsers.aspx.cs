using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Users_UpdateUsers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int userID = 0;
        bool validUser = int.TryParse(Request.QueryString["ID"], out userID);

        if (validUser)
        {
            if (!IsPostBack)
            {
                GetUser(userID);
            }
        }
    }

    private void GetUser(int userId)
    {
        using (var con = new SqlConnection(Helper.GetCon()))
        using (var cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = @"SELECT UserPic, FirstName, LastName, Birthday,
                EmailAdd, MobileNo, Address,
                Status FROM Clients WHERE UserID = @id";
            cmd.Parameters.AddWithValue("@id", userId);
            using (var dr = cmd.ExecuteReader())
            {
                if (dr.HasRows)
                {
                    if (dr.Read())
                    {
                        imgUser.ImageUrl = "~/clientpics/" + dr["UserPic"];
                        imgUserLb.NavigateUrl = "~/clientpics/" + dr["UserPic"];
                        txtFN.Text = dr["FirstName"].ToString();
                        txtLN.Text = dr["LastName"].ToString();

                        DateTime bDay = Convert.ToDateTime(dr["Birthday"].ToString());
                        txtBday.Text = bDay.ToString("yyyy-MM-dd");

                        txtEmail.Text = dr["EmailAdd"].ToString();
                        txtMobile.Text = dr["MobileNo"].ToString();
                        txtAddr.Text = dr["Address"].ToString();
                        ddlStatus.SelectedValue = dr["Status"].ToString();
                    }
                }
            }
        }
    }

    protected void btnSubmit_OnClick(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(Helper.GetCon()))
        using (SqlCommand cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;

            if (usrPicUpload.HasFile)
            {
                cmd.CommandText = @"UPDATE Clients SET UserPic = @userpic, FirstName = @fn,
                        LastName = @ln, Birthday = @bday, EmailAdd = @email,
                        MobileNo = @mobno, Address = @addr, Status = @status,
                        DateModified = @dmod WHERE UserID = @id";
            }
            else
            {
                cmd.CommandText = @"UPDATE Clients SET FirstName = @fn,
                        LastName = @ln, Birthday = @bday, EmailAdd = @email,
                        MobileNo = @mobno, Address = @addr, Status = @status,
                        DateModified = @dmod WHERE UserID = @id";
            }

            string fileExt = Path.GetExtension(usrPicUpload.FileName);
            string id = Guid.NewGuid().ToString();
            cmd.Parameters.AddWithValue("@userpic", id + fileExt);
            usrPicUpload.SaveAs(Server.MapPath("~/clientpics/" + id + fileExt));

            cmd.Parameters.AddWithValue("@fn", txtFN.Text);
            cmd.Parameters.AddWithValue("@ln", txtLN.Text);
            cmd.Parameters.AddWithValue("@bday", txtBday.Text);
            cmd.Parameters.AddWithValue("@email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@mobno", txtMobile.Text);
            cmd.Parameters.AddWithValue("@addr", txtAddr.Text);
            cmd.Parameters.AddWithValue("@status", ddlStatus.SelectedValue);
            cmd.Parameters.AddWithValue("@dmod", Helper.PHTime());
            cmd.Parameters.AddWithValue("@id", Request.QueryString["ID"]);
            cmd.ExecuteNonQuery();
        }

        Response.Redirect("View.aspx");
    }

    protected void btnBack_OnClick(object sender, EventArgs e)
    {
        Response.Redirect("View.aspx");
    }
}