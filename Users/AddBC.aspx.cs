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

public partial class Users_AddBC : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Helper.ValidateAdmin();
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

        GetBodyComp();
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
            cmd.Parameters.AddWithValue("@id", hfName.Value);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            con.Close();
            da.Fill(ds, "BodyComp");
            lvBodyComp.DataSource = ds;
            lvBodyComp.DataBind();
        }
    }

    protected void btnSubmit_OnClick(object sender, EventArgs e)
    {
        if (hfName.Value != "")
        {
            pnlClientError.Visible = false;

            using (var con = new SqlConnection(Helper.GetCon()))
            using (var cmd = new SqlCommand())
            {
                con.Open();
                cmd.Connection = con;
                cmd.CommandText = @"INSERT INTO BodyComp
                                (UserID, BodyType, Gender, Age, Height, ClothesWeight, Weight,
                                FatPer, FatMass, FFM, MuscleMass, TBW, TBWPer, BoneMass, BMR,
                                MetAge, VFR, BMI, DateAdded)
                                VALUES
                                (@uid, @btype, @gender, @age, @hght, @cwght, @wght,
                                @fatp, @fmass, @ffm, @mmass, @tbw, @tbwper, @bmass, @bmr,
                                @mage, @vfr, @bmi, @dadded)";
                cmd.Parameters.AddWithValue("@uid", hfName.Value);
                cmd.Parameters.AddWithValue("@btype", txtBType.Text);
                cmd.Parameters.AddWithValue("@gender", ddlGender.SelectedValue);
                cmd.Parameters.AddWithValue("@age", txtAge.Text);
                cmd.Parameters.AddWithValue("@hght", txtHght.Text);
                cmd.Parameters.AddWithValue("@cwght", txtCWght.Text);
                cmd.Parameters.AddWithValue("@wght", txtWght.Text);
                cmd.Parameters.AddWithValue("@fatp", txtFatPer.Text);
                cmd.Parameters.AddWithValue("@fmass", txtFMass.Text);
                cmd.Parameters.AddWithValue("@ffm", txtFFM.Text);
                cmd.Parameters.AddWithValue("@mmass", txtMMass.Text);
                cmd.Parameters.AddWithValue("@tbw", txtTBW.Text);
                cmd.Parameters.AddWithValue("@tbwper", txtTBWPer.Text);
                cmd.Parameters.AddWithValue("@bmass", txtBMass.Text);
                cmd.Parameters.AddWithValue("@bmr", txtBMR.Text);
                cmd.Parameters.AddWithValue("@mage", txtMAge.Text);
                cmd.Parameters.AddWithValue("@vfr", txtVFR.Text);
                cmd.Parameters.AddWithValue("@bmi", txtBMI.Text);
                cmd.Parameters.AddWithValue("@dadded", Helper.PHTime());
                cmd.ExecuteNonQuery();
            }

            GetBodyComp();
        }
        else
        {
            pnlClientError.Visible = true;
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
        Literal ltBCID = (Literal) e.Item.FindControl("ltBCID");

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
}