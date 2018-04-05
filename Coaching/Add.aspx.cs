using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Coaching_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static List<string> GetName(string prefixText)
    {
        List<string> name = new List<string>();

        using (SqlConnection conn = new SqlConnection())
        {
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["myCon"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = @"SELECT FirstName, LastName, UserID FROM Clients WHERE 
                    FirstName LIKE @SearchText OR
                    LastName LIKE @SearchText
                    AND Status = 'Active' ORDER BY LastName ASC";
                cmd.Parameters.AddWithValue("@SearchText", "%" + prefixText + "%");
                cmd.Connection = conn;
                conn.Open();
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        string myString = dr["LastName"] + ", " + dr["FirstName"] + "/vn/" + dr["UserID"];
                        name.Add(myString);
                    }
                }
                conn.Close();
            }

        }
        return name;
    }

    protected void btnUser_OnClick(object sender, EventArgs e)
    {
        if (hfName.Value != "0")
        {
            using (var con = new SqlConnection(Helper.GetCon()))
            using (var cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = @"SELECT UserID, FirstName, LastName, Birthday,
                EmailAdd, MobileNo, Address,
                Status
                FROM Clients 
                WHERE UserID = @id";
                cmd.Parameters.AddWithValue("@id", hfName.Value);
                using (var dr = cmd.ExecuteReader())
                {
                    if (dr.HasRows)
                    {
                        if (dr.Read())
                        {
                            txtFN.Text = dr["FirstName"].ToString();
                            txtLN.Text = dr["LastName"].ToString();
                            DateTime bDay = DateTime.Parse(dr["Birthday"].ToString());
                            txtBday.Text = bDay.ToString("MM-dd-yyyy");
                            txtEmail.Text = dr["EmailAdd"].ToString();
                            txtAddr.Text = dr["Address"].ToString();
                            txtMobile.Text = dr["MobileNo"].ToString();
                            txtStatus.Text = dr["Status"].ToString();
                        }
                    }
                }
            }
        }

        GetCoachingHist();
    }

    protected void btnBack_OnClick(object sender, EventArgs e)
    {
        Response.Redirect("View.aspx");
    }

    protected void btnSubmit_OnClick(object sender, EventArgs e)
    {
        using (var con = new SqlConnection(Helper.GetCon()))
        using (var cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = @"INSERT INTO Training
                            (UserID, GoalSetting, TrainingPackage, TrainingFee,
                            DateAdded) VALUES
                            (@userid, @gsetting, @tpackage, @tfee, @dadded)
                            SELECT TOP 1 TrainingID FROM Training ORDER BY TrainingID DESC";
            cmd.Parameters.AddWithValue("@userid", hfName.Value);
            cmd.Parameters.AddWithValue("@gsetting", ddlGoal.SelectedValue);
            cmd.Parameters.AddWithValue("@tpackage", ddlPackage.SelectedValue);
            cmd.Parameters.AddWithValue("@tfee", txtCoachFee.Text);
            cmd.Parameters.AddWithValue("@dadded", Helper.PHTime());
            int trainID = (int)cmd.ExecuteScalar();

            cmd.CommandText = @"INSERT INTO TrainingDetails
                              (TrainingID, ProgressPicFront, ProgressPicSide, ProgressPicBack, 
                                Age, Height, Weight, Arms, Chest, Waist,
                               Hip, Thigh, Legs, Monday, Tuesday, Wednesday,
                               Thursday, Friday, Saturday, DateAdded) VALUES
                              (@tid, @progfrnt, @progside, @progback, @age, @hght, @wght, @arms, @chst, @wst, @hip,
                               @thgh, @lgs, @mon, @tue, @wed, @thu, @fri, @sat, @dadd)";
            cmd.Parameters.AddWithValue("@tid", trainID);

            if (!fileFront.HasFile)
            {
                cmd.Parameters.AddWithValue("@progfrnt", "front.jpg");
            }
            else
            {
                string fileExt = Path.GetExtension(fileFront.FileName);
                string id = Guid.NewGuid().ToString();
                cmd.Parameters.AddWithValue("@progfrnt", id + fileExt);
                fileFront.SaveAs(Server.MapPath("~/clientprogress/" + id + fileExt));
            }

            if (!fileSide.HasFile)
            {
                cmd.Parameters.AddWithValue("@progside", "side.jpg");
            }
            else
            {
                string fileExt = Path.GetExtension(fileSide.FileName);
                string id = Guid.NewGuid().ToString();
                cmd.Parameters.AddWithValue("@progside", id + fileExt);
                fileSide.SaveAs(Server.MapPath("~/clientprogress/" + id + fileExt));
            }

            if (!fileBack.HasFile)
            {
                cmd.Parameters.AddWithValue("@progback", "back.jpg");
            }
            else
            {
                string fileExt = Path.GetExtension(fileBack.FileName);
                string id = Guid.NewGuid().ToString();
                cmd.Parameters.AddWithValue("@progback", id + fileExt);
                fileBack.SaveAs(Server.MapPath("~/clientprogress/" + id + fileExt));
            }

            cmd.Parameters.AddWithValue("@age", txtAge.Text);
            cmd.Parameters.AddWithValue("@hght", txtHeight.Text);
            cmd.Parameters.AddWithValue("@wght", txtWeight.Text);
            cmd.Parameters.AddWithValue("@arms", txtArms.Text);
            cmd.Parameters.AddWithValue("@chst", txtChst.Text);
            cmd.Parameters.AddWithValue("@wst", txtWst.Text);
            cmd.Parameters.AddWithValue("@hip", txtHip.Text);
            cmd.Parameters.AddWithValue("@thgh", txtThgh.Text);
            cmd.Parameters.AddWithValue("@lgs", txtLgs.Text);

            cmd.Parameters.AddWithValue("@mon", chkMon.Checked);
            cmd.Parameters.AddWithValue("@tue", chkTues.Checked);
            cmd.Parameters.AddWithValue("@wed", chkWed.Checked);
            cmd.Parameters.AddWithValue("@thu", chkThurs.Checked);
            cmd.Parameters.AddWithValue("@fri", chkFri.Checked);
            cmd.Parameters.AddWithValue("@sat", chkSat.Checked);

            cmd.Parameters.AddWithValue("@dadd", txtCurrentDate.Text);
            cmd.ExecuteNonQuery();

            GetCoachingHist();        }
    }

    private void GetCoachingHist()
    {
        using (var con = new SqlConnection(Helper.GetCon()))
        using (var cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = @"SELECT ProgressPicFront, Training.TrainingID, GoalSetting, TrainingPackage,
                                Weight, TrainingDetails.DateAdded
                                FROM Training
                                INNER JOIN TrainingDetails
                                ON Training.TrainingID = TrainingDetails.TrainingID
                                WHERE UserID = @id ORDER BY TrainingDetails.DateAdded DESC";
            cmd.Parameters.AddWithValue("@id", hfName.Value);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            con.Close();
            da.Fill(ds, "Training");
            lvCoaching.DataSource = ds;
            lvCoaching.DataBind();
        }
    }

    protected void lvCoaching_OnPagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        dpCoachHist.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        GetCoachingHist();
    }

    protected void lvCoaching_OnDataBound(object sender, EventArgs e)
    {
        dpCoachHist.Visible = dpCoachHist.PageSize < dpCoachHist.TotalRowCount;
    }

    protected void lvCoaching_OnItemCommand(object sender, ListViewCommandEventArgs e)
    {
        Literal ltTrainID = (Literal)e.Item.FindControl("ltTrainID");

        using (var con = new SqlConnection(Helper.GetCon()))
        using (var cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = @"SELECT ProgressPicFront, ProgressPicSide, ProgressPicBack,
                                Age, Weight, Height, Arms,
                                Chest, Waist, Hip, Thigh, Legs, GoalSetting,
                                TrainingPackage, TrainingFee, TrainingDetails.DateAdded,        
                                Monday, Tuesday, Wednesday, Thursday, Friday, Saturday
                                FROM Training
                                INNER JOIN TrainingDetails
                                ON Training.TrainingID = TrainingDetails.TrainingID
                                WHERE Training.TrainingID = @id";
            cmd.Parameters.AddWithValue("@id", ltTrainID.Text);
            using (var dr = cmd.ExecuteReader())
            {
                if (dr.HasRows)
                {
                    if (dr.Read())
                    {
                        imgFront.ImageUrl = "~/clientprogress/" + dr["ProgressPicFront"];
                        lnkFront.NavigateUrl = "~/clientprogress/" + dr["ProgressPicFront"];

                        imgSide.ImageUrl = "~/clientprogress/" + dr["ProgressPicSide"];
                        lnkSide.NavigateUrl = "~/clientprogress/" + dr["ProgressPicSide"];

                        imgBack.ImageUrl = "~/clientprogress/" + dr["ProgressPicBack"];
                        lnkBack.NavigateUrl = "~/clientprogress/" + dr["ProgressPicBack"];

                        txtAge2.Text = dr["Age"].ToString();
                        txtWght2.Text = dr["Weight"].ToString();
                        txtHght2.Text = dr["Height"].ToString();
                        txtArms2.Text = dr["Arms"].ToString();
                        txtChst2.Text = dr["Chest"].ToString();
                        txtWst2.Text = dr["Waist"].ToString();
                        txtHip2.Text = dr["Hip"].ToString();
                        txtThgh2.Text = dr["Thigh"].ToString();
                        txtLgs2.Text = dr["Legs"].ToString();
                        txtGoal.Text = dr["GoalSetting"].ToString();
                        txtPackage.Text = dr["TrainingPackage"].ToString();
                        txtCoachFee2.Text = decimal.Parse(dr["TrainingFee"].ToString()).ToString("c");

                        DateTime dAdded = DateTime.Parse(dr["DateAdded"].ToString());
                        txtTOR.Text = dAdded.ToString("MMMM dd, yyyy");

                        chkMon2.Checked = dr["Monday"].ToString() == "1" ? true : false;
                        chkTue2.Checked = dr["Tuesday"].ToString() == "1" ? true : false;
                        chkWed2.Checked = dr["Wednesday"].ToString() == "1" ? true : false;
                        chkThu2.Checked = dr["Thursday"].ToString() == "1" ? true : false;
                        chkFri2.Checked = dr["Friday"].ToString() == "1" ? true : false;
                        chkSat2.Checked = dr["Saturday"].ToString() == "1" ? true : false;
                    }
                }
            }
        }


        ScriptManager.RegisterStartupScript(Page, Page.GetType(), 
            "coachingDetails", "$('#coachingDetails').modal();", true);
    }
}