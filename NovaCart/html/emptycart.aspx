<%@ Page Title="" Language="C#" MasterPageFile="~/html/main.master" AutoEventWireup="true" CodeBehind="emptycart.aspx.cs" Inherits="NovaCart.html.emptycart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <title>NovaCart | Empty Cart</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style >
        .text-center{
            padding-top:70px;
        }
    </style>
    <section class="h-100 gradient-custom">
        <div class="container py-5">
            <div class="row d-flex justify-content-center my-4">
                <div class="col-md-8">
                    <div class="card mb-4">
                        <div class="card-body text-center">
                            <h5 class="text-center">Your cart is empty</h5><br />
                            <img src="../images/empty cart.jpg" height="300px" width ="500px" />
                            <br />
                            <button type="button" class="btn btn-primary btn-sm me-1 mb-2" onclick="backtohome()" style='margin-left:0px;'>
    <i class="fas fa-trash"></i> Back to Home
</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script >
        function backtohome() {
            window.location.href = "index.aspx";
        }
    </script>
</asp:Content>
