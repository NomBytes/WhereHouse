<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CustomerPage.aspx.cs" Inherits="Default4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            font-size: x-large;
        }
        .newStyle1 {
            background-color: #FFF7E7;
            color: #800000;
            text-align:center;
        }
        .newStyle2 {
            background-color: #DEBA84;
        }
        .newStyle3 {
            background-color: #DEBA84;
        }
        .newStyle4 {
            background-color: #DEBA84;
        }
        .background{
            background-color:#F6DDCC;  
        }
    </style>
</head>
<body class =" background">
    <form id="form1" runat="server">
        <a href="homepage.aspx">back</a> 
        <div style ="text-align:center "  class =" newStyle1">
            <strong>Customers</strong></div>
        <p>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" HorizontalAlign ="Center" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" >
                <Columns>
                    <asp:BoundField DataField="storeName" HeaderText="storeName" SortExpression="storeName" />
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />
            </asp:GridView>
        </p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NormalizationConnectionString %>" SelectCommand="SELECT [storeName] FROM [CUSTOMERS]"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="storeID" DataSourceID="OrderStatus" AllowSorting="True" HorizontalAlign = "Center" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
            <Columns>
                <asp:BoundField DataField="storeID" HeaderText="storeID" ReadOnly="True" SortExpression="storeID" />
                <asp:BoundField DataField="storeName" HeaderText="storeName" SortExpression="storeName" />
                <asp:BoundField DataField="orderStatus" HeaderText="orderStatus" SortExpression="orderStatus" />
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
        <asp:SqlDataSource ID="OrderStatus" runat="server" ConnectionString="<%$ ConnectionStrings:NormalizationConnectionString %>" SelectCommand="SELECT CUSTOMERS.storeID, CUSTOMERS.storeName, ORDERS.orderStatus
FROM CUSTOMERS
LEFT JOIN ORDERS
ON CUSTOMERS.storeID = ORDERS.storeID"></asp:SqlDataSource>
    </form>
</body>
</html>
