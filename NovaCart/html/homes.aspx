<%@ Page Title="" Language="C#" MasterPageFile="~/html/main.master" AutoEventWireup="true" CodeBehind="homes.aspx.cs" Inherits="NovaCart.html.homes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>NovaCart | Homes & Appliances</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
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
            <a href="?productname=Television" class="list-group-item list-group-item-action">Television</a>
            <a href="?productname=Washing Machine" class="list-group-item list-group-item-action">Washing Machine</a>
            <a href="?productname=Air Conditioner" class="list-group-item list-group-item-action">Air Conditioner</a>
            <a href="?productname=Refridgerator" class="list-group-item list-group-item-action">Refridgerator</a>
            <a href="?productname=Smart Appliances" class="list-group-item list-group-item-action">Smart Appliances</a>
        </div>
    </div>
    
    <div class="col-md-9">
        <div class="row" id="productsContainer2" runat="server">
            <!-- Products will be dynamically loaded here -->
        </div>
    </div>
</div>
</asp:Content>
