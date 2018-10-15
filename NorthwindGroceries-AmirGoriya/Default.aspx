<%@ Page Title="Northwind Groceries" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NorthwindGroceries_AmirGoriya._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Button ID="btnToggleDiscontinued" runat="server" Text="Hide Discontinued" CssClass="btn btn-secondary mb-2 d-none" OnClick="btnToggleDiscontinued_Click" />
    <div class="row">
        <asp:ListView ID="lvProductList" runat="server" DataSourceID="dsProductList">
            <ItemTemplate>
                <div class="col-md-4 bg-light border border-success rounded m-1">
                    <p>
                        Product Name:
                        <strong>
                            <asp:HyperLink ID="lnkProductItem" CssClass="text-success" NavigateUrl='<%# Eval("ProductID", "~/Default?ProductID={0}") %>' runat="server"><%# Eval("ProductName")%></asp:HyperLink></strong>
                        <br />
                        Quantity per Product:
                        <strong>
                            <asp:Label ID="QuantityPerUnitLabel" runat="server" Text='<%# Eval("QuantityPerUnit") %>' /></strong>
                        <br />
                        Unit Price:
                        <strong>
                            <asp:Label ID="UnitPriceLabel" runat="server" Text='<%# Eval("UnitPrice") %>' /></strong>
                        <br />
                    </p>
                </div>
            </ItemTemplate>
        </asp:ListView>
    </div>
    <asp:ListView ID="lvProductDetails" runat="server" DataKeyNames="ProductID" DataSourceID="dsProductDetails">
        <ItemTemplate>

            <div class="row bg-light border rounded m-1 p-3">
                <div class="col-md-4">
                    <p>
                        Product Name:
                <strong>
                    <asp:Label ID="ProductNameLabel" runat="server" Text='<%# Eval("ProductName") %>' CssClass="text-info" /></strong>
                        <br />
                        Product ID: <strong>
                            <asp:Label ID="ProductIDLabel" runat="server" Text='<%# Eval("ProductID") %>' /></strong>
                        <br />
                        Supplier ID:
                <strong>
                    <asp:Label ID="SupplierIDLabel" runat="server" Text='<%# Eval("SupplierID") %>' /></strong>
                        <br />
                        Category ID:
                <strong>
                    <asp:Label ID="CategoryIDLabel" runat="server" Text='<%# Eval("CategoryID") %>' /></strong>
                        <br />
                        Quantity per Unit:
                <strong>
                    <asp:Label ID="QuantityPerUnitLabel" runat="server" Text='<%# Eval("QuantityPerUnit") %>' /></strong>
                        <br />
                        Unit Price:
                <strong>
                    <asp:Label ID="UnitPriceLabel" runat="server" Text='<%# Eval("UnitPrice") %>' /></strong>
                        <br />
                        Units in Stock:
                <strong>
                    <asp:Label ID="UnitsInStockLabel" runat="server" Text='<%# Eval("UnitsInStock") %>' /></strong>
                        <br />
                        Units on Order:
                <strong>
                    <asp:Label ID="UnitsOnOrderLabel" runat="server" Text='<%# Eval("UnitsOnOrder") %>' /></strong>
                        <br />
                        Re-order Level:
                <strong>
                    <asp:Label ID="ReorderLevelLabel" runat="server" Text='<%# Eval("ReorderLevel") %>' /></strong>
                        <br />
                        <asp:CheckBox ID="DiscontinuedCheckBox" runat="server" Checked='<%# Eval("Discontinued") %>' Enabled="false" Text="Discontinued" />
                        <br />
                    </p>
                </div>
            </div>
        </ItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="dsProductDetails" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" SelectCommand="SELECT * FROM [Products] WHERE ([ProductID] = @ProductID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ProductID" QueryStringField="ProductID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsProductList" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" SelectCommand="SELECT [ProductID], [ProductName], [QuantityPerUnit], [UnitPrice], [Discontinued] FROM [Products] WHERE ([CategoryID] = @CategoryID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="CategoryID" QueryStringField="CategoryID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
