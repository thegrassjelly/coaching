using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Schedule_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
    }

    protected void btnSubmit_OnClick(object sender, EventArgs e)
    {
        using (var con = new SqlConnection(Helper.GetCon()))
        using (var cmd = new SqlCommand())
        {
            DateTime bdt = Convert.ToDateTime(txtStime.Text);
            DateTime edt = Convert.ToDateTime(txtETime.Text);

            con.Open();
            cmd.Connection = con;
            cmd.CommandText = @"INSERT INTO Scheduler
                                (Type, StartDate, EndDate, AllDay, Subject, Location,
                                OriginalOccurrenceStart, OriginalOccurrenceEnd, Description, Status,
                                Label, TimeZoneID)
                                VALUES
                                (@type, @sdate, @edate, @aday, @sub, @loc, @oos, @ooe, @desc,
                                @stat, @label, @tzid)";
            cmd.Parameters.AddWithValue("@type", 0);
            cmd.Parameters.AddWithValue("@sdate", bdt);
            cmd.Parameters.AddWithValue("@edate", edt);
            cmd.Parameters.AddWithValue("@aday", "False");
            cmd.Parameters.AddWithValue("@sub", txtSubject.Text);
            cmd.Parameters.AddWithValue("@loc", "Anytime Fitness");
            cmd.Parameters.AddWithValue("@oos", bdt);
            cmd.Parameters.AddWithValue("@ooe", edt);
            cmd.Parameters.AddWithValue("@desc", txtDesc.Text);
            cmd.Parameters.AddWithValue("@stat", 2);
            cmd.Parameters.AddWithValue("@label", 0);
            cmd.Parameters.AddWithValue("@tzid", "Singapore Standard Time");
            cmd.ExecuteNonQuery();
        }

        Response.Redirect("View.aspx");
    }
}