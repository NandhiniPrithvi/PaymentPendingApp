<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddDetail.aspx.cs" Inherits="PaymentPendingApp.AddDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td colspan="2">
                    Add The Details</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblname" runat="server" Text="Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revName" runat="server" 
                        ControlToValidate="txtName" ErrorMessage="Enter valid name" 
                        ValidationExpression="[a-zA-Z ]*$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbleventdate" runat="server" Text="Event Date"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEventDate" runat="server"></asp:TextBox>
                    <asp:Button ID="btnCalendar" runat="server" onclick="btnCalendar_Click" 
                        Text="&gt;&gt;" />
                    <asp:Calendar ID="calEventDate" runat="server" 
                        onselectionchanged="calEventDate_SelectionChanged" Visible="False">
                    </asp:Calendar>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbltotalpackage" runat="server" Text="Total Package"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtTotalPackage" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revtotPackage" runat="server" 
                        ControlToValidate="txtTotalPackage" ErrorMessage="Enter valid amoumt" 
                        ValidationExpression="((\d+)((\.\d{1,2})?))$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblamountreceived" runat="server" Text="Amount Received"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtAmountReceived" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revtotPackage0" runat="server" 
                        ControlToValidate="txtAmountReceived" ErrorMessage="Enter valid amoumt" 
                        ValidationExpression="((\d+)((\.\d{1,2})?))$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblamountpending" runat="server" Text="Amount Pending"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtAmountPending" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revtotPackage1" runat="server" 
                        ControlToValidate="txtAmountPending" ErrorMessage="Enter valid amoumt" 
                        ValidationExpression="((\d+)((\.\d{1,2})?))$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbldeliverables" runat="server" Text="Deliverables"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlDeliverables" runat="server" 
                        AppendDataBoundItems="True" onload="ddlDeliverables_Load">
                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <br />
                    <br />
                    <asp:Button ID="btnSave" runat="server" onclick="btnSave_Click" Text="Save" />
&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblmessage" runat="server" Text="Label" Visible="False"></asp:Label>
                    <br />
                    <br />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
