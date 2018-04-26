<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Products</title>
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
<body style="width: 1219px; height: 415px" class =" background">
    <form id="form1" runat="server">
        <p class="auto-style1">
            <a href= "homepage.aspx">back</a></p>
        <p class="auto-style1" style="text-align:center">
            <span class="newStyle1">Products</span></p>
        <div  style="margin-left:auto; margin-right:auto;">
        <asp:GridView ID="GridView1"  HorizontalAlign="Center" runat="server" AutoGenerateColumns="False" DataKeyNames="productID" DataSourceID="SqlDataSource1" style="text-align:center" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Pname" HeaderText="Pname" SortExpression="Pname" />
                <asp:BoundField DataField="warehouseID" HeaderText="warehouseID" SortExpression="warehouseID" />
                <asp:BoundField DataField="aisle" HeaderText="aisle" SortExpression="aisle" />
                <asp:BoundField DataField="Plevel" HeaderText="Plevel" SortExpression="Plevel" />
                <asp:BoundField DataField="Pcategory" HeaderText="Pcategory" SortExpression="Pcategory" />
                <asp:BoundField DataField="productID" HeaderText="productID" ReadOnly="True" SortExpression="productID" />
                <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NormalizationConnectionString %>" SelectCommand="SELECT * FROM [PRODUCTS]"></asp:SqlDataSource>
        <br />
        <p class="newStyle1">List of all order place that contain each product</p>
        <asp:GridView ID="ordersThatContainEachProduct" runat="server" AutoGenerateColumns="False" DataSourceID="ordereachproduct" HorizontalAlign ="Center" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
            <Columns>
                <asp:BoundField DataField="Pname" HeaderText="Pname" SortExpression="Pname" />
                <asp:BoundField DataField="orderID" HeaderText="orderID" SortExpression="orderID" />
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
        <asp:SqlDataSource ID="ordereachproduct" runat="server" ConnectionString="<%$ ConnectionStrings:NormalizationConnectionString %>" SelectCommand="SELECT PRODUCTS.Pname, ORDERS.orderID
FROM PRODUCTS
FULL OUTER JOIN ORDERS ON PRODUCTS.productID = (select Items.productID from Items where Items.orderID = Orders.orderId);"></asp:SqlDataSource>
    </form>
</body>
</html>
