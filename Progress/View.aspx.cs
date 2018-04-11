using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Progress_View : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetGoals();
            GetProgress(txtSearch.Text);
        }
    }

    void GetGoals()
    {
        using (var con = new SqlConnection(Helper.GetCon()))
        using (var cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = @"SELECT DISTINCT GoalSetting FROM Training";
            SqlDataReader dr = cmd.ExecuteReader();
            ddlGoal.DataSource = dr;
            ddlGoal.DataTextField = "GoalSetting";
            ddlGoal.DataValueField = "GoalSetting";
            ddlGoal.DataBind();
            ddlGoal.Items.Insert(0, "All Goals");
        }
    }

    private void GetProgress(string search)
    {
        using (var con = new SqlConnection(Helper.GetCon()))
        using (var cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;

            if (ddlGoal.SelectedValue == "All Goals")
            {
                cmd.CommandText = @"SELECT
                                      Clients.FirstName,
                                      Clients.LastName,
                                      Training.GoalSetting,
                                      TrainingDetails.Age,
                                      TrainingDetails.Weight,
                                      TrainingDetails.DateAdded,
                                      TrainingDetails.ProgressPicFront,
                                      Clients.UserID
                                    FROM Clients
                                    INNER JOIN Training
                                      ON Clients.UserID = Training.UserID
                                    INNER JOIN TrainingDetails
                                      ON Training.TrainingID = TrainingDetails.TrainingID
                                    WHERE (Clients.FirstName LIKE @keyword
                                    OR Clients.LastName LIKE @keyword)
                                    ORDER BY TrainingDetails.DateAdded DESC";
            }
            else
            {
                cmd.CommandText = @"SELECT
                                      Clients.FirstName,
                                      Clients.LastName,
                                      Training.GoalSetting,
                                      TrainingDetails.Age,
                                      TrainingDetails.Weight,
                                      TrainingDetails.DateAdded,
                                      TrainingDetails.ProgressPicFront,
                                      Clients.UserID
                                    FROM Clients
                                    INNER JOIN Training
                                      ON Clients.UserID = Training.UserID
                                    INNER JOIN TrainingDetails
                                      ON Training.TrainingID = TrainingDetails.TrainingID
                                    WHERE (Clients.FirstName LIKE @keyword
                                    OR Clients.LastName LIKE @keyword)
                                    AND GoalSetting = @gsetting
                                    ORDER BY TrainingDetails.DateAdded DESC";
            }

            cmd.Parameters.AddWithValue("@gsetting", ddlGoal.SelectedValue);
            cmd.Parameters.AddWithValue("@keyword", "%" + search + "%");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            con.Close();
            da.Fill(ds, "Clients");
            lvProgress.DataSource = ds;
            lvProgress.DataBind();
        }
    }

    protected void ddlGoal_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        GetProgress(txtSearch.Text);
    }

    protected void txtSearch_OnTextChanged(object sender, EventArgs e)
    {
        GetProgress(txtSearch.Text);
    }

    protected void btnSearch_OnClick(object sender, EventArgs e)
    {
        GetProgress(txtSearch.Text);
    }

    protected void lvProgress_OnPagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        dpProgress.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        GetProgress(txtSearch.Text);
    }

    protected void lvProgress_OnDataBound(object sender, EventArgs e)
    {
        dpProgress.Visible = dpProgress.PageSize < dpProgress.TotalRowCount;
    }
}