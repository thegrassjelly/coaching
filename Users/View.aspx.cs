using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Users_View : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetUsers(txtSearch.Text);
        }

        this.Form.DefaultButton = this.btnSearch.UniqueID;
    }

    private void GetUsers(string txtSearchText)
    {
        using (var con = new SqlConnection(Helper.GetCon()))
        using (var cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = @"SELECT UserID, UserPic, FirstName, LastName, MobileNo, Birthday,
                            Status, DateAdded, DateModified
                            FROM Clients
                            WHERE (UserID LIKE @keyword OR 
                            LastName LIKE @keyword OR 
                            FirstName LIKE @keyword) 
                            AND Status = @status ORDER BY DateAdded DESC";
            cmd.Parameters.AddWithValue("@status", ddlStatus.SelectedValue);
            cmd.Parameters.AddWithValue("@keyword", "%" + txtSearchText + "%");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            con.Close();
            da.Fill(ds, "Clients");
            lvUsers.DataSource = ds;
            lvUsers.DataBind();
        }
    }

    protected void lvUsers_OnPagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        dpUsers.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        GetUsers(txtSearch.Text);
    }

    protected void lvUsers_OnDataBound(object sender, EventArgs e)
    {
        dpUsers.Visible = dpUsers.PageSize < dpUsers.TotalRowCount;
    }

    protected void ddlStatus_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        GetUsers(txtSearch.Text);
    }

    protected void txtSearch_OnTextChanged(object sender, EventArgs e)
    {
        GetUsers(txtSearch.Text);
    }

    protected void btnSearch_OnClick(object sender, EventArgs e)
    {
        GetUsers(txtSearch.Text);
    }

    protected void lvUsers_OnItemCommand(object sender, ListViewCommandEventArgs e)
    {
        Literal ltUserID = (Literal)e.Item.FindControl("ltUserID");

        using (var con = new SqlConnection(Helper.GetCon()))
        using (var cmd = new SqlCommand())
        {
            con.Open();
            cmd.Connection = con;
            cmd.CommandText = @"DELETE FROM Clients
                                WHERE UserID = @id";
            cmd.Parameters.AddWithValue("@id", ltUserID.Text);
            cmd.ExecuteNonQuery();
        }

        GetUsers(txtSearch.Text);
    }
}