using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    OleDbConnection DBConnection;
    OleDbCommand DBCommand;
    OleDbDataReader DBReader;
    String SQLstring;

   
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Search_Click(object sender, EventArgs e)
    {
    
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
       /*DBConnection = new OleDbConnection("Provider = .NET Framework Data Provider for SQL Server; Data Source = " + Server.MapPath("DBExample.mdb"));
        DBConnection.Open();
        SQLstring = ("Select * From WAREHOUSE WHERE warehouseID LIKE \'%" + (TextBox1.Text + "%\'"));
        DBCommand = new OleDbCommand(SQLstring, DBConnection);
        DBReader = DBCommand.ExecuteReader();
        DisplayResults.DataSource = DBReader;
        DisplayResults.DataBind();*/

    }
}