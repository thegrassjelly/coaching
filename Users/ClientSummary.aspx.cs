using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Users_ClientSummary : System.Web.UI.Page
{
    static int _UserID;
    static Literal _WID;

    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();

        int userID = 0;
        bool validUser = int.TryParse(Request.QueryString["ID"], out userID);

        if (validUser)
        {
            if (!IsPostBack)
            {
                _UserID = userID;
                GetUser(userID);
                GetBodyComp();
                GetCoachingHist();
                GetClientSessions();
            }
        }
    }

    private void GetUser(int userID)
    {
        using (var con = new SqlConnection(Helper.GetCon()))
        using (var cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = @"SELECT UserPic, FirstName, LastName, Birthday,
                EmailAdd, MobileNo, Address,
                Status FROM Clients WHERE UserID = @id";
            cmd.Parameters.AddWithValue("@id", userID);
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

    private void GetClientSessions()
    {
        using (var con = new SqlConnection(Helper.GetCon()))
        using (var cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = @"SELECT WorkoutID, SessionNumber, DateAdded
                                FROM Workout WHERE UserID = @id";
            cmd.Parameters.AddWithValue("@id", _UserID);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            con.Close();
            da.Fill(ds, "Workout");
            lvWorkoutList.DataSource = ds;
            lvWorkoutList.DataBind();
        }
    }

    private void GetModalWorkouts(Literal wid)
    {
        using (var con = new SqlConnection(Helper.GetCon()))
        using (var cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = @"SELECT BodyPart, WorkoutName, Weight,
                                Repetitions, Sets, WorkoutDetails.DateAdded
                                FROM Workout 
                                INNER JOIN WorkoutDetails
                                ON Workout.WorkoutID = WorkoutDetails.WorkoutID
                                WHERE Workout.UserID = @id AND WorkoutDetails.WorkoutID = @wid";
            cmd.Parameters.AddWithValue("@id", _UserID);
            cmd.Parameters.AddWithValue("@wid", wid.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            con.Close();
            da.Fill(ds, "Workout");
            lvWDModal.DataSource = ds;
            lvWDModal.DataBind();
        }
    }


    private void GetBodyComp()
    {
        using (var con = new SqlConnection(Helper.GetCon()))
        using (var cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = @"SELECT BCID, DateAdded, Weight, FatPer,
                                FatMass, MuscleMass
                                FROM BodyComp WHERE UserID = @id";
            cmd.Parameters.AddWithValue("@id", _UserID);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            con.Close();
            da.Fill(ds, "BodyComp");
            lvBodyComp.DataSource = ds;
            lvBodyComp.DataBind();
        }
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
            cmd.Parameters.AddWithValue("@id", _UserID);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            con.Close();
            da.Fill(ds, "Training");
            lvCoaching.DataSource = ds;
            lvCoaching.DataBind();
        }
    }

    protected void lvBodyComp_OnPagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        dpBodyComp.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        GetBodyComp();
    }

    protected void lvBodyComp_OnDataBound(object sender, EventArgs e)
    {
        dpBodyComp.Visible = dpBodyComp.PageSize < dpBodyComp.TotalRowCount;
    }

    protected void lvBodyComp_OnItemCommand(object sender, ListViewCommandEventArgs e)
    {
        Literal ltBCID = (Literal)e.Item.FindControl("ltBCID");

        using (var con = new SqlConnection(Helper.GetCon()))
        using (var cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;

            if (e.CommandName == "details")
            {
                cmd.CommandText = @"SELECT BodyType, Gender, Age, Height, Weight, ClothesWeight,
                                FatPer, FatMass, FFM, MuscleMass, TBW, TBWPer, BoneMass,
                                BMR, MetAge, VFR, BMI FROM BodyComp WHERE BCID = @id";
                cmd.Parameters.AddWithValue("@id", ltBCID.Text);
                using (var dr = cmd.ExecuteReader())
                {
                    if (dr.HasRows)
                    {
                        if (dr.Read())
                        {
                            txtBType2.Text = dr["BodyType"].ToString();
                            txtGender2.Text = dr["Gender"].ToString();
                            txtAge2.Text = dr["Age"].ToString();
                            txtHght2.Text = dr["Height"].ToString();
                            txtWght2.Text = dr["Weight"].ToString();
                            txtCWght2.Text = dr["ClothesWeight"].ToString();
                            txtFatPer2.Text = dr["FatPer"].ToString();
                            txtFatMass2.Text = dr["FatMass"].ToString();
                            txtFFM2.Text = dr["FFM"].ToString();
                            txtMMass2.Text = dr["MuscleMass"].ToString();
                            txtTBW2.Text = dr["TBW"].ToString();
                            txtTBWPer2.Text = dr["TBWPer"].ToString();
                            txtBMass2.Text = dr["BoneMass"].ToString();
                            txtBMR2.Text = dr["BMR"].ToString();
                            txtMAge2.Text = dr["MetAge"].ToString();
                            txtVFR2.Text = dr["VFR"].ToString();
                            txtBMI2.Text = dr["BMI"].ToString();
                        }
                    }
                }

                ScriptManager.RegisterStartupScript(Page, Page.GetType(),
                    "details", "$('#details').modal();", true);
            }
            else if (e.CommandName == "delitem")
            {
                cmd.CommandText = @"DELETE FROM BodyComp WHERE BCID = @id";
                cmd.Parameters.AddWithValue("@id", ltBCID.Text);
                cmd.ExecuteNonQuery();

                GetBodyComp();
            }

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

            if (e.CommandName == "coachingDetails")
            {
                cmd.CommandText = @"SELECT ProgressPicFront, ProgressPicSide, ProgressPicBack,
                                Age, Weight, Height, Arms,
                                Chest, Waist, Hip, Legs, GoalSetting,
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
                            //txtThgh2.Text = dr["Thigh"].ToString();
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

                ScriptManager.RegisterStartupScript(Page, Page.GetType(),
                    "coachingDetails", "$('#coachingDetails').modal();", true);
            }
            else
            {
                cmd.CommandText = @"DELETE FROM Training WHERE
                                    TrainingID = @id";
                cmd.Parameters.AddWithValue("@id", ltTrainID.Text);
                cmd.ExecuteNonQuery();

                GetCoachingHist();
            }
        }

    }

    protected void lvWorkoutList_OnItemCommand(object sender, ListViewCommandEventArgs e)
    {
        _WID = (Literal)e.Item.FindControl("ltWList");

        GetModalWorkouts(_WID);

        ScriptManager.RegisterStartupScript(Page, Page.GetType(),
            "workdetails", "$('#workdetails').modal();", true);
    }


    protected void lvWorkoutList_OnPagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        dpWorkoutList.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        GetClientSessions();
    }

    protected void lvWDModal_OnPagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        dpWDModal.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        GetModalWorkouts(_WID);
    }

    protected void lvWorkoutList_OnDataBound(object sender, EventArgs e)
    {
        dpWorkoutList.Visible = dpWorkoutList.PageSize < dpWorkoutList.TotalRowCount;
    }

    protected void lvWDModal_OnDataBound(object sender, EventArgs e)
    {
        dpWDModal.Visible = dpWDModal.PageSize < dpWDModal.TotalRowCount;
    }
}