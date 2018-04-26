<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Orders.aspx.cs" Inherits="Default3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title style ="text-align:center">Orders</title>
    <style type="text/css">
        #form1 {
            font-size: x-large;
        }
        .newStyle1 {
            background-color: #FFF7E7;
            color: #800000;
            text-align:center
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
        <a href = "homepage.aspx"> back </a>
        
        <div class="newStyle1">
            <p class="auto-style2">Orders </p>
        </div>    
        <asp:GridView ID="GridView1" runat="server" DataSourceID="Normalization" AutoGenerateColumns="False" DataKeyNames="orderId" HorizontalAlign ="Center" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
            <Columns>
                <asp:BoundField DataField="orderId" HeaderText="orderId" ReadOnly="True" SortExpression="orderId" />
                <asp:BoundField DataField="orderStatus" HeaderText="orderStatus" SortExpression="orderStatus" />
                <asp:BoundField DataField="storeID" HeaderText="storeID" SortExpression="storeID" />
                <asp:BoundField DataField="orderDate" HeaderText="orderDate" SortExpression="orderDate" />
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                <asp:BoundField DataField="total" HeaderText="total" SortExpression="total" />
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
        <asp:SqlDataSource ID="Normalization" runat="server" ConnectionString="<%$ ConnectionStrings:NormalizationConnectionString %>" SelectCommand="SELECT * FROM [ORDERS]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [ORDERS]"></asp:SqlDataSource>
        <p style=" text-align:center">Orders total by Stores<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="storeList" DataTextField="storeName" DataValueField="storeID">
            </asp:DropDownList>
            <asp:SqlDataSource ID="storeList" runat="server" ConnectionString="<%$ ConnectionStrings:NormalizationConnectionString %>" SelectCommand="SELECT [storeName], [storeID] FROM [CUSTOMERS]"></asp:SqlDataSource>
        </p>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="droplistresults" HorizontalAlign ="Center" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
            <Columns>
                <asp:BoundField DataField="storeName" HeaderText="storeName" SortExpression="storeName" />
                <asp:BoundField DataField="OrderCount" HeaderText="OrderCount" ReadOnly="True" SortExpression="OrderCount" />
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
        <asp:SqlDataSource ID="droplistresults" runat="server" ConnectionString="<%$ ConnectionStrings:NormalizationConnectionString %>" SelectCommand="SELECT CUSTOMERS.storeName, COUNT(ORDERS.OrderID) AS OrderCount 
FROM ORDERS
LEFT JOIN CUSTOMERS ON CUSTOMERS.storeID = ORDERS.storeID
where Customers.StoreID = @storeId
GROUP BY CUSTOMERS.storeNAME;">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="storeId" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="displayOrderResults" runat="server"></asp:SqlDataSource>
        <asp:SqlDataSource ID="OrdersPerStoreNormalization" runat="server" ConnectionString="<%$ ConnectionStrings:NormalizationConnectionString %>" SelectCommand="SELECT CUSTOMERS.storeName, COUNT(ORDERS.OrderID) AS OrderCount 
FROM ORDERS
LEFT JOIN CUSTOMERS ON CUSTOMERS.storeID = ORDERS.storeID
GROUP BY CUSTOMERS.storeNAME;


"></asp:SqlDataSource>
        <asp:SqlDataSource ID="ordersperstore" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT CUSTOMERS.storeName, COUNT(ORDERS.OrderID) AS OrderCount 
FROM ORDERS
LEFT JOIN CUSTOMERS ON CUSTOMERS.storeID = ORDERS.storeID
GROUP BY CUSTOMERS.storeNAME;"></asp:SqlDataSource>
    </form>
</body>
</html>
