using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

namespace PaymentPendingApp
{
    public partial class ViewDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string ConStr = "";
            string path = Server.MapPath("excelSheet.xlsx");
            ConStr = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + path + ";Extended Properties=\"Excel 12.0;HDR=yes;\"";
            string query = "SELECT * FROM [SHEET1$]";
            OleDbConnection conn = new OleDbConnection(ConStr);
            OleDbCommand cmd = new OleDbCommand(query, conn);
            OleDbDataAdapter da = new OleDbDataAdapter(cmd);
            DataTable dt = new DataTable();
            try
            {
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                da.Fill(dt);
                gvDetails.DataSource = dt;
                gvDetails.DataBind();
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            finally
            {
                conn.Close();
            }
        }
    }
}