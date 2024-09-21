<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="NovaCart.html.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.2/mdb.min.css" rel="stylesheet" />
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.2/mdb.umd.min.js"></script>
    <link rel="stylesheet" href="../css/registration.css" />

    <script src="../js/login.js"></script>
    <title runat="server">Novacart | Login</title>

</head>

<body>
    <section class="vh-100 gradient-custom">
        <div class="container py-5 h-100">
            <div class="row justify-content-center align-items-center h-100">
                <div class="col-12 col-lg-9 col-xl-7">
                    <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
                        <div class="card-body p-4 p-md-5">
                            <h3 class="mb-4 pb-2 pb-md-0 mb-md-5 text-center">Login</h3>
                            <form id="form1" runat="server">

                                <div class="form-outline mb-4">
                                    <asp:TextBox ID="TextBox11" runat="server" ClientIDMode="Static" class="form-control form-control-lg custom-width" />
                                    <asp:Label class="form-label" ID="Label11" runat="server" Text="User Name"  for="TextBox11"></asp:Label>
                                    <i class="fas fa-user form-icon" id ="ico"></i>
                                </div>

                                <div class="form-outline mb-4">
                                    <asp:TextBox ID="TextBox12" runat="server" TextMode="Password" ClientIDMode="Static" class="form-control form-control-lg custom-width" />
                                    <asp:Label class="form-label" ID="Label12" runat="server" Text="Password" for="TextBox12"></asp:Label>
                                    <i class="fas fa-lock form-icon" id ="ico"></i>
                                </div>

                                <div class="mt-4 pt-2 text-center">
                                    <asp:Button CssClass="btn btn-success btn-lg" ID="Button2" runat="server" Text="Login" OnClick="Button2_Click"  />
                                </div>
                                <asp:Label ID="ErrorMessage" runat="server" CssClass="text-danger text-center d-block mt-2" />
    

                                <p id="login" class="text-center text-muted mt-5 mb-0">Don't have an account? 
                                    <a id="registerLink" href="javascript:void(0)" class="fw-bold text-body" style="text-decoration:none;">Register here</a>
                                </p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>


    <script type="text/javascript">
        document.getElementById("registerLink").onclick = function () {
            window.location.href = "Registration.aspx"; 
        };
    </script>
</body>
</html>
