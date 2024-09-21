<%@ Page Title="" Language="C#" MasterPageFile="~/html/main.master" AutoEventWireup="true" CodeBehind="electronics.aspx.cs" Inherits="NovaCart.html.electronics" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <title>NovaCart | Electronics Products</title>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        #zzz {
            padding-top: 100px;
        }

        .card {
            max-width: 100%;
            border-radius: 0.5rem;
            overflow: hidden; 
            display: flex;
            flex-direction: column;
            height: 100%;
        }

        .custom-card-size {
            width: 100%;
            max-width: 320px;
            margin: 0 auto; 
        }
        
        .custom-card-img {
            width: 100%;
            height: 180px;
        }

        body {
            overflow-x: hidden; 
            overflow-y: auto; 
            margin: 0;
            padding: 0;
        }
 
        .row {
            margin-left: 0;
            margin-right: 0;
        }

        .col-md-6, .col-lg-4 {
            padding: 15px; 
        }

        .custom-card-size {
            margin-bottom: 30px; 
        }

        #productsContainer {
            overflow-y: auto;
            overflow-x: hidden; 
        }

        .row {
            display: flex;
            flex-wrap: wrap;
        }

        .card {
            display: flex;
            flex-direction: column;
            flex: 1;
            height: 100%;
        }
     
        .card-body .btn {
            min-width: 100px; 
            height: 40px; 
            margin-right: 5px;
        }

        .card-body .d-flex {
            align-items: flex-end; 
        }
    </style>
    
    <div class="row" id="zzz">
        <div class="col-md-3">
            <div class="list-group">
                <a href="?productname=Mobiles" class="list-group-item list-group-item-action">Mobiles</a>
                <a href="?productname=Laptops" class="list-group-item list-group-item-action">Laptops</a>
                <a href="?productname=Speakers" class="list-group-item list-group-item-action">Speakers</a>
                <a href="?productname=Cameras" class="list-group-item list-group-item-action">Cameras</a>
                <a href="?productname=Accessories" class="list-group-item list-group-item-action">Accessories</a>
            </div>
        </div>
        
        <div class="col-md-9">
            <div class="row" id="productsContainer" runat="server">
                <!-- Products will be dynamically loaded here -->
            </div>
        </div>
    </div>

</asp:Content>
