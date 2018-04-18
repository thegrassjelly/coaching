using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxScheduler;
using DevExpress.XtraScheduler;

public partial class Schedule_View : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            schScheduler.OptionsCustomization.AllowAppointmentDrag = UsedAppointmentType.None;
            schScheduler.OptionsBehavior.ClientTimeZoneId = "Singapore Standard Time";
        }
    }
}