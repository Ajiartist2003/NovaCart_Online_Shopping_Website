<%@ Page Title="" Language="C#" MasterPageFile="~/html/main.master" AutoEventWireup="true" CodeBehind="invoice.aspx.cs" Inherits="NovaCart.html.invoice" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <title>NovaCart | Invoice</title>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="card" style="padding-top:100px;">
        <div class="card-body">
            <div class="container mb-5 mt-3">
                <div align="center">
                    <img src="../images/novaclogo.png" height="100px" width="300px"/>
                </div>
                <div class="row d-flex align-items-baseline">
                    <div class="col-xl-9">
                        <p style="color: #7e8d9f; font-size: 20px;">Invoice >> <strong>ID: <asp:Label ID="lblInvoiceID" runat="server" Text="ID"></asp:Label></strong></p>
                    </div>
                    <div class="col-xl-3 float-end">
                        <asp:Button ID="btnPrintInvoice" runat="server" Text="Print" CssClass="btn btn-light text-capitalize" OnClientClick="window.print(); return false;" />

                        <asp:Button ID="btnDownloadInvoice" runat="server" Text="Download" CssClass="btn btn-primary text-capitalize" OnClick="DownloadInvoice_Click" />
                    </div>
                </div>

                <div class="row">
                    <div class="col-xl-8">
                        <ul class="list-unstyled">
                            <li class="text-muted">To: <span style="color:#5d9fc5;"> <asp:Label ID="lblUserName" runat="server" Text="User Name"></asp:Label></span></li>
                            <li class="text-muted"><asp:Label  runat="server" Text="Shipping Address:"></asp:Label></li>
                            <li class="text-muted"><asp:Label ID="lblUserAddress" runat="server" Text="User Address"></asp:Label></li>
                            <li class="text-muted"><asp:Label ID="lblUserPhone" runat="server" Text="User Phone"></asp:Label></li>
                        </ul>
                    </div>
                    <div class="col-xl-4">
                        <p class="text-muted">Invoice </p>
                        <ul class="list-unstyled">
                            <li class="text-muted"><i class="fas fa-circle" style="color:#84B0CA;"></i> <span class="fw-bold">Creation Date: </span><asp:Label ID="lblCreationDate" runat="server" Text="Creation Date"></asp:Label></li>
                            <li class="text-muted"><i class="fas fa-circle" style="color:#84B0CA;"></i> <span class="fw-bold">Status:</span><span class="badge bg-warning text-black fw-bold">Paid</span></li>
                        </ul>
                    </div>
                </div>

                <div class="row my-2 mx-1 justify-content-center">
                    <table class="table table-striped table-borderless">
                        <thead style="background-color:#84B0CA;" class="text-white">
                            <tr>
                                <th>S/No</th>
                                <th>Product Name</th>
                                <th>Quantity</th>
                                <th>Unit Price</th>
                                <th>Total Amount</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td><asp:Label ID="lblProductName" runat="server" Text="Product Name"></asp:Label></td>
                                
                                <td><asp:Label ID="lblQuantity" runat="server" Text="Quantity"></asp:Label></td>
                               
                                <td><asp:Label ID="lblProductPrice" runat="server" Text="Product Price"></asp:Label></td>
                               
                                <td><asp:Label ID="lblTotalPrice" runat="server" Text="Total Price"></asp:Label></td
                            </tr>
                        </tbody>
                    </table>
                </div>
                <hr>
                <div class="row">
                    <div class="col-xl-10">
                        <p>Thank you for your purchase</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
