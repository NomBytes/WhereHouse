<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Homepage.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Where-House Inventory Management</title>
    <style type="text/css">
        #form1 {
            font-size: x-large;
        }
        .newStyle1 {
            background-color: #FFF7E7;
            color: #800000;
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
      
       
        <div style = "text-align:center">
            <img src="capture.png" alt="Flowers in Chania" width="100" height="100"/>
            <div style =" text-align:center">
                <span class="newStyle1">The Where-House
            </span>
            </div>
            
        </div>
        <p style =" text-align:center">
        <a href = "orders.aspx" class="newStyle4">Orders&nbsp;&nbsp;</a> <a href = "products.aspx" class="newStyle3">products</a> <span class="newStyle2"> <a href = "CustomerPage.aspx">Customers</a></span>
         </p>
    
        <div style ="text-align:center">
            
        <p id="searchButton">
            
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [storeName], [storeID] FROM [CUSTOMERS]"></asp:SqlDataSource>
            
            <asp:DataList ID="DataList1" runat="server" DataSourceID="shipmentcount" HorizontalAlign ="Center" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" GridLines="Both">
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <ItemTemplate>
                    NumberOfShipments:
                    <asp:Label ID="NumberOfShipmentsLabel" runat="server" Text='<%# Eval("NumberOfShipments") %>' />
                    <br />
<br />
                </ItemTemplate>
                <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            </asp:DataList>
            <asp:SqlDataSource ID="shipmentcount" runat="server" ConnectionString="<%$ ConnectionStrings:NormalizationConnectionString %>" SelectCommand="SELECT COUNT(*) AS NumberOfShipments
FROM shipments;
"></asp:SqlDataSource>
            
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="3" DataKeyNames="warehouseID" DataSourceID="SqlDataSource3" HorizontalAlign="Center" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2">
                <Columns>
                    <asp:BoundField DataField="warehouseID" HeaderText="warehouseID" ReadOnly="True" SortExpression="warehouseID" />
                    <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
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
            
            <asp:SqlDataSource ID="wareHouseDropList" runat="server"></asp:SqlDataSource>
            
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:NormalizationConnectionString %>" SelectCommand="SELECT * FROM [WAREHOUSE]"></asp:SqlDataSource>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="stores" DataTextField="storeName" DataValueField="storeID">
            </asp:DropDownList>
            <asp:SqlDataSource ID="stores" runat="server" ConnectionString="<%$ ConnectionStrings:NormalizationConnectionString %>" SelectCommand="SELECT * FROM [CUSTOMERS]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [WAREHOUSE]"></asp:SqlDataSource>
            <p class =" newStyle1" style =" text-align:center">Warehouses Stores are affiliated to</p>
            <asp:GridView ID="warehouseOfstore" runat="server" AutoGenerateColumns="False" DataKeyNames="warehouseID" DataSourceID="StoresandWarehouse" HorizontalAlign="Center" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2"  >
                <Columns>
                    <asp:BoundField DataField="warehouseID" HeaderText="warehouseID" ReadOnly="True" SortExpression="warehouseID" />
                    <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
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
            <asp:SqlDataSource ID="StoresandWarehouse" runat="server" ConnectionString="<%$ ConnectionStrings:NormalizationConnectionString %>" SelectCommand="select w.warehouseID, w.address
from warehouse w, ships_from sh
where w.warehouseID = (select sh.warehouseID where 
sh.orderID = ANY(select orderID from ORDERS where storeID = @storeID));">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="storeID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        </div>
        <div style ="text-align : center">
    <p>
        Currently most popular products</p>
        <p>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="popularProducts" HorizontalAlign="Center" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                <Columns>
                    <asp:BoundField DataField="pname" HeaderText="pname" SortExpression="pname" />
                    <asp:BoundField DataField="productID" HeaderText="productID" SortExpression="productID" />
                    <asp:BoundField DataField="orderID" HeaderText="orderID" SortExpression="orderID" />
                    <asp:BoundField DataField="arrival_date" HeaderText="arrival_date" SortExpression="arrival_date" />
                    <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
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
            <asp:SqlDataSource ID="popularProducts" runat="server" ConnectionString="<%$ ConnectionStrings:NormalizationConnectionString %>" SelectCommand="SELECT p.pname, p.productID, i.orderID, sh.arrival_date, i.quantity
FROM SHIPMENTS sh,ITEMS i,products p
WHERE i.orderID = sh.orderID and i.productID = p.productID and i.quantity &gt; (
SELECT AVG(i.quantity) FROM ITEMS i, SHIPMENTS sh WHERE i.orderID = sh.orderID);"></asp:SqlDataSource>

    </p>
    </div>
    </form>
    <p>
        &nbsp;</p>
    
     
    </body>
</html>
