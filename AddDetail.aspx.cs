using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Collections;
using System.Data.OleDb;
using System.Data;
using System.Configuration;

namespace PaymentPendingApp
{
    public partial class AddDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ArrayList deliverables = new ArrayList();
                deliverables.Add("DVD");
                deliverables.Add("Album");
                deliverables.Add("Wedding");
                deliverables.Add("Outdoor");
                deliverables.Add("Photos");
                ddlDeliverables.DataSource = deliverables;
                ddlDeliverables.DataBind();
            }
        }

        protected void btnCalendar_Click(object sender, EventArgs e)
        {
            calEventDate.Visible = true;
        }

        protected void calEventDate_SelectionChanged(object sender, EventArgs e)
        {
            calEventDate.Visible = false;
            txtEventDate.Text = calEventDate.SelectedDate.ToShortDateString();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string ConStr = "";
            string path = Server.MapPath("excelSheet.xlsx");
            ConStr = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + path + ";Extended Properties=\"Excel 12.0;HDR=yes;\"";
            string query="INSERT INTO [SHEET1$] ([Name],[Event Date],[Total Package],[Amount Received],[Amount Pending],[Deliverables]) VALUES ('"+txtName.Text+"','"+txtEventDate.Text+"','"+txtTotalPackage.Text+"','"+txtAmountReceived.Text+"','"+txtAmountPending.Text+"','"+ddlDeliverables.SelectedItem.ToString()+"')";
            OleDbConnection conn=new OleDbConnection(ConStr);
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
                OleDbCommand cmd = new OleDbCommand(query, conn);
                int result=cmd.ExecuteNonQuery();
                if(result>0)
                {
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    lblmessage.Visible = true;
                    lblmessage.Text="Failed";
                }
                conn.Close();
            }
        }

        protected void ddlDeliverables_Load(object sender, EventArgs e)
        {
            string[] color = {"Black","Red","Blue","Green","Orange","Violet" };
            for (int i = 0; i < ddlDeliverables.Items.Count; i++)
            {
                ddlDeliverables.Items[i].Attributes.Add("Style", "color:" + color[i]);
            }
        }
    }
}