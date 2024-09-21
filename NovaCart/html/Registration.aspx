 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="NovaCart.Registration" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.2/mdb.min.css" rel="stylesheet" />
    
    <link rel="stylesheet" href="../css/registration.css?v=1.0" />
    <script src="../js/reg.js?v=1.0"></script>

    <title>Novacart | Registration</title>
</head>

<body >
    <section>
        <div class="container py-5 h-40">
            <div class="row justify-content-center align-items-center">
                <div class="col-12 col-lg-9 col-xl-7">
                    <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
                        <div class="card-body p-4 p-md-5">
                            <h3 class="mb-4 pb-2 pb-md-0 mb-md-5 text-center" id="reg">Registration Form</h3>
                            <form id="form1" runat="server">

                                <div class="row">
                                    <div class="col-md-6 mb-4">
                                        <div class="form-outline">
                                            <asp:TextBox ID="TextBox1" runat="server" ClientIDMode="Static" class="form-control form-control-lg" />
                                            <asp:Label class="form-label" ID="Label1" runat="server" Text="First Name" for="TextBox1"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-4">
                                        <div class="form-outline">
                                            <asp:TextBox ID="TextBox2" runat="server" ClientIDMode="Static" class="form-control form-control-lg" />
                                            <asp:Label class="form-label" ID="Label2" runat="server" Text="Last Name" for="TextBox2"></asp:Label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6 mb-4">
                                        <div class="form-outline">
                                            <asp:TextBox ID="TextBox3" runat="server" TextMode="Email" ClientIDMode="Static" class="form-control form-control-lg" />
                                            <asp:Label class="form-label" ID="Label3" runat="server" Text="Email" for="TextBox3"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-4">
                                        <div class="form-outline">
                                            <asp:TextBox ID="TextBox6" runat="server" ClientIDMode="Static" class="form-control form-control-lg" />
                                            <asp:Label class="form-label" ID="Label6" runat="server" Text="User Name" for="TextBox6"></asp:Label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6 mb-4">
                                        <div class="form-outline">
                                            <asp:TextBox ID="TextBox4" runat="server" TextMode="Password" ClientIDMode="Static" class="form-control form-control-lg" />
                                            <asp:Label class="form-label" ID="Label4" runat="server" Text="Password" for="TextBox4"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-4">
                                        <div class="form-outline">
                                            <asp:TextBox ID="TextBox5" runat="server" TextMode="Password" ClientIDMode="Static" class="form-control form-control-lg" />
                                            <asp:Label class="form-label" ID="Label5" runat="server" Text="Confirm Password" for="TextBox5"></asp:Label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6 mb-4">
                                        <div class="form-outline">
                                            <asp:TextBox ID="TextBox7" runat="server" ClientIDMode="Static" class="form-control form-control-lg" />
                                            <asp:Label class="form-label" ID="Label7" runat="server" Text="Phone Number" for="TextBox7"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-4">
                                        
                                        <div class="form-outline">
                                            <asp:TextBox ID="TextBox10" runat="server" TextMode="SingleLine" ClientIDMode="Static" class="form-control form-control-lg" />
                                            <asp:Label class="form-label" ID="Label8" runat="server" Text="Pin Code" for="TextBox9"></asp:Label>
                                        </div>
                                
                                </div>
                            </div>
                                <div class="row mb-4">
                                   
                                    <div class="form-outline">
                                        <asp:TextBox ID="TextBox8" runat="server" TextMode="MultiLine" ClientIDMode="Static" class="form-control form-control-lg" OnTextChanged="TextBox8_TextChanged" />
                                        <asp:Label class="form-label" ID="Label9" runat="server" Text="Address" for="TextBox8"></asp:Label>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="form-check d-flex justify-content-center mb-5">
                                        <asp:CheckBox ID="CheckBox1" runat="server" CssClass="form-input me-2" />
                                        <label class="form-check-label" for="<%= CheckBox1.ClientID %>">
                                            I agree to all statements in <a href="#!" class="text-body">Terms of Service</a>
                                        </label>
                                    </div>
                                </div>

                                <div class="mt-4 pt-2 text-center">
                                    <asp:Button CssClass="btn btn-primary btn-lg" ID="Button1" runat="server" Text="Register" OnClick="Button1_Click" />
                                </div>

                                <p id="login" class="text-center text-muted mt-5 mb-0">Already have an account? <a  id="loginLink" href="javascript:void(0)"
                                        class="fw-bold text-body" style="text-decoration:none;">Login here</a></p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script type="text/javascript">
        document.getElementById("loginLink").onclick = function () {
            
            window.location.href = "Login.aspx"; 
        };
</script>
</body>
</html>
