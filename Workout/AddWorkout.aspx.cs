using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Coaching_AddWorkout : System.Web.UI.Page
{
    static Literal _WID;

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

    [WebMethod]
    public static List<string> SearchWorkout(string prefixText)
    {
        List<string> name = new List<string>();

        using (SqlConnection conn = new SqlConnection())
        {
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["myCon"].ConnectionString;
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = @"SELECT WorkoutName FROM WorkoutDetails WHERE
                    WorkoutName LIKE @SearchText ORDER BY WorkoutName ASC";
                cmd.Parameters.AddWithValue("@SearchText", "%" + prefixText + "%");
                cmd.Connection = conn;
                conn.Open();
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        name.Add(dr["WorkoutName"].ToString());
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

        GetClientSessions();
        GetWorkoutDetails();
    }

    private void GetWorkoutDetails()
    {
        using (var con = new SqlConnection(Helper.GetCon()))
        using (var cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = @"SELECT WorkoutDetailsID, BodyPart, WorkoutName, Weight,
                                Repetitions, Sets, DateAdded
                                FROM WorkoutDetails WHERE UserID = @id AND WorkoutID = '-1'";
            cmd.Parameters.AddWithValue("@id", hfName.Value);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            con.Close();
            da.Fill(ds, "WorkoutDetails");
            lvWorkout.DataSource = ds;
            lvWorkout.DataBind();
        }
    }

    protected void btnBack_OnClick(object sender, EventArgs e)
    {
        Response.Redirect("ViewWorkouts.aspx");
    }

    protected void btnAdd_OnClick(object sender, EventArgs e)
    {
        if (hfName.Value != "0")
        {
            pnlClient.Visible = false;

            using (var con = new SqlConnection(Helper.GetCon()))
            using (var cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = @"INSERT INTO WorkoutDetails
                                    (WorkoutID, UserID, BodyPart, WorkoutName, Weight, Repetitions,
                                    Sets, DateAdded)
                                    VALUES
                                    (@wid, @uid, @bpart, @wname, @wght, @reps, @sets, @dadded)";
                cmd.Parameters.AddWithValue("@wid", -1);
                cmd.Parameters.AddWithValue("@uid", hfName.Value);
                cmd.Parameters.AddWithValue("@bpart", ddlBodyPart.SelectedValue);
                cmd.Parameters.AddWithValue("@wname", txtWorkoutNme.Text);
                cmd.Parameters.AddWithValue("@wght", txtWeight.Text);
                cmd.Parameters.AddWithValue("@reps", txtReps.Text);
                cmd.Parameters.AddWithValue("@sets", txtSets.Text);
                cmd.Parameters.AddWithValue("@dadded", Helper.PHTime());
                cmd.ExecuteNonQuery();
            }

            GetWorkoutDetails();
        }
        else
        {
            pnlClient.Visible = true;
        }
    }

    protected void btnSubmit_OnClick(object sender, EventArgs e)
    {
        if (txtSession.Text != "")
        {
            pnlSession.Visible = false;

            using (var con = new SqlConnection(Helper.GetCon()))
            using (var cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = @"INSERT INTO Workout
                                    (UserID, SessionNumber, DateAdded)
                                    VALUES (@uid, @snum, @dadd);
                                    SELECT TOP 1 WorkoutID FROM Workout 
                                    ORDER BY WorkoutID DESC";
                cmd.Parameters.AddWithValue("@uid", hfName.Value);
                cmd.Parameters.AddWithValue("@snum", txtSession.Text);
                cmd.Parameters.AddWithValue("@dadd", Helper.PHTime());
                int workid = (int)cmd.ExecuteScalar();

                cmd.Parameters.Clear();
                cmd.CommandText = @"UPDATE WorkoutDetails SET
                                    WorkoutID = @wid
                                    WHERE WorkoutID = '-1' AND UserID = @uid";
                cmd.Parameters.AddWithValue("@wid", workid);
                cmd.Parameters.AddWithValue("@uid", hfName.Value);
                cmd.ExecuteNonQuery();
            }
        }
        else
        {
            pnlSession.Visible = true;
        }

        GetClientSessions();
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
            cmd.Parameters.AddWithValue("@id", hfName.Value);
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
            cmd.Parameters.AddWithValue("@id", hfName.Value);
            cmd.Parameters.AddWithValue("@wid", wid.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            con.Close();
            da.Fill(ds, "Workout");
            lvWDModal.DataSource = ds;
            lvWDModal.DataBind();
        }
    }

    protected void lvWorkoutList_OnItemCommand(object sender, ListViewCommandEventArgs e)
    {
        _WID = (Literal)e.Item.FindControl("ltWList");

        GetModalWorkouts(_WID);

        ScriptManager.RegisterStartupScript(Page, Page.GetType(),
            "details", "$('#details').modal();", true);
    }

    protected void lvWorkout_OnItemCommand(object sender, ListViewCommandEventArgs e)
    {
        Literal ltWorkID = (Literal)e.Item.FindControl("ltWorkID");

        using (var con = new SqlConnection(Helper.GetCon()))
        using (var cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = @"DELETE FROM WorkoutDetails
                                WHERE WorkoutDetailsID = @id";
            cmd.Parameters.AddWithValue("@id", ltWorkID.Text);
            cmd.ExecuteNonQuery();
        }

        GetWorkoutDetails();
    }

    protected void lvWorkout_OnPagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        dpWorkouts.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        GetWorkoutDetails();
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

    protected void lvWorkout_OnDataBound(object sender, EventArgs e)
    {
        dpWorkouts.Visible = dpWorkouts.PageSize < dpWorkouts.TotalRowCount;
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