using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Helper
/// </summary>
public class Helper
{
	public Helper()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static DateTime PHTime()
    {
        var timeUtc = DateTime.UtcNow;
        var chinaTz = TimeZoneInfo.FindSystemTimeZoneById("China Standard Time");
        var phTime = TimeZoneInfo.ConvertTimeFromUtc(timeUtc, chinaTz);

        return phTime;
    }

    public static string GetCon()
    {
        return ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString;
    }
}