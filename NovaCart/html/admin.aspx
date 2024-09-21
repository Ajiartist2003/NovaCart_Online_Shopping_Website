<%@ Page Title="" Language="C#" MasterPageFile="~/html/main.master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="NovaCart.html.admin" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <title>NovaCart | Admin</title>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style >
        #fd {
            background-image: url('../images/admin.jpg');
            background-position: center;
            background-size: cover;
        }
    </style>
    <div id="fd" >
    <div class="container py-5">
        <h2>Add New Product</h2>
        <div class="row">
            <div class="col-md-8 col-lg-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <asp:Panel CssClass="container" runat ="server" >
                            <div class="mb-3">
                                <label for="productName" class="form-label" style="font-weight :500;" >Product Name</label>
                                <asp:TextBox ID="txtProductName1" CssClass="form-control" runat="server" />
                            </div>
                            <div class="mb-3">
                                <label for="category" class="form-label" style="font-weight :500;">Category</label>
                                <asp:DropDownList ID="ddlCategory1" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="Electronics Products">Electronics Products</asp:ListItem>
                                    <asp:ListItem Value="Books & Magazines">Books & Magazines</asp:ListItem>
                                    <asp:ListItem Value="Home & Kitchens">Home & Kitchens</asp:ListItem>
                                    
                                </asp:DropDownList>
                            </div>
                            <div class="mb-3">
                                <label for="model" class="form-label" style="font-weight :500;">Model</label>
                                <asp:TextBox ID="txtmodel" CssClass="form-control" runat="server" />
                            </div>
                            <div class="mb-3">
                                <label for="price" class="form-label" style="font-weight :500;">Price</label>
                                <asp:TextBox ID="txtPrice1" CssClass="form-control" runat="server" />
                            </div>
                            <div class="mb-3">
                                <label for="imageUrl" class="form-label" style="font-weight :500;">Product Image</label>
                                <asp:FileUpload ID="fuImage" CssClass="form-control" runat="server" />
                            </div>
                            <div class="mb-3">
                                <label for="description" class="form-label" style="font-weight :500;">Description</label>
                                <asp:TextBox ID="txtDescription" CssClass="form-control" TextMode="MultiLine" Rows="4" runat="server" />
                            </div>
                            <div class="mb-3">
                                <label for="quantity" class="form-label" style="font-weight :500;">Quantity</label>
                                <asp:TextBox ID="txtQuantity" CssClass="form-control" runat="server" />
                            </div>
                            <asp:Button ID="btnSubmit1" Text="Add Product" CssClass="btn btn-primary" runat="server" OnClick="btnSubmit1_Click1" style="font-weight :500;"
                                />
                            <asp:Button ID="btndetails" Text="Get Details" CssClass="btn btn-primary" runat="server" OnClick="btndetails_Click" style="font-weight :500;"/>
                            <asp:Button ID="btnupdate" Text="Update Product" CssClass="btn btn-primary" runat="server" OnClick="btnupdate_Click" style="font-weight :500;" />
                            <asp:Button ID="btnremove" Text="Remove Product" CssClass="btn btn-primary" runat="server" OnClick="btnremove_Click" style="font-weight :500;" />
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
    </div>
  </div>
</asp:Content>
