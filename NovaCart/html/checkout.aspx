<%@ Page Title="" Language="C#" MasterPageFile="~/html/main.master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="NovaCart.html.checkout" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <title>NovaCart | Checkout</title>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .quantity-control {
  display: flex;
  align-items: center;
  justify-content: space-between;
  width: fit-content;
  margin: 0 auto;
  background: #eaeaea;
  border-radius: 10px;
  padding: 1rem 0.4rem;
  margin-top: 4rem;
}

.quantity-btn {
  background: transparent;
  border: none;
  outline: none;
  margin: 0;
  padding: 0px 8px;
  cursor: pointer;
}
.quantity-btn svg {
  width: 15px;
  height: 15px;
}
.quantity-input {
  outline: none;
  user-select: none;
  text-align: center;
  width: 47px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: transparent;
  border: none;
}
.quantity-input::-webkit-inner-spin-button,
.quantity-input::-webkit-outer-spin-button {
  -webkit-appearance: none;
  margin: 0;
}
        
    </style>
    
    <section class="h-100 gradient-custom">
        <div class="container py-5">
            <div class="row d-flex justify-content-center my-4">
                <div class="col-md-8">
                    <div class="card mb-4">
                        <div class="card-header py-3">
                            <h5 class="mb-0">Cart</h5>
                        </div>
                        <div class="card-body">
                            <div class="row" id="productDetails">
                                <div class="col-lg-3 col-md-12 mb-4 mb-lg-0">
                                    <div class="bg-image hover-overlay hover-zoom ripple rounded">
                                        <img id="productImg" src="#" runat="server" class="w-100" alt="Product Image" />
                                    </div>
                                </div>

                                <div class="col-lg-5 col-md-6 mb-4 mb-lg-0">
                                    <p><strong id="productName" runat="server"></strong></p>
                                    <p id="productModel" runat="server"></p><br />
                                    <h4>Description:</h4>
                                    <ul>
                                        <li>
                                            <p id="productdesc" runat="server" style="text-align:justify;"></p>
                                        </li>
                                    </ul>
                                </div>
                                    
                                    <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                                        <p class="text-start text-md-center">
                                            <strong>Rs.<span id="productPrice" runat="server"></span></strong>
                                        </p>

                                    <div class="quantity-control" data-quantity="" style ="margin-bottom:50px;">
                                        <button type="button" class="quantity-btn" id="quantityMinusBtn" onclick="updateQuantity('minus')" data-quantity-minus="">
                                            <svg viewBox="0 0 409.6 409.6">
                                              <g>
                                                <path d="M392.533,187.733H17.067C7.641,187.733,0,195.374,0,204.8s7.641,17.067,17.067,17.067h375.467 c9.426,0,17.067-7.641,17.067-17.067S401.959,187.733,392.533,187.733z" />
                                              </g>
                                          </svg>

                                        </button>
                                        <input type="number" id="quantityValue" class="quantity-input" data-quantity-target="" value="1" step="1" name="quantityValue">
                                        <button  type="button" class="quantity-btn" onclick="updateQuantity('add')" id="quantityPlusBtn" data-quantity-plus=""><svg viewBox="0 0 426.66667 426.66667">
                                            <path d="m405.332031 192h-170.664062v-170.667969c0-11.773437-9.558594-21.332031-21.335938-21.332031-11.773437 0-21.332031 9.558594-21.332031 21.332031v170.667969h-170.667969c-11.773437 0-21.332031 9.558594-21.332031 21.332031 0 11.777344 9.558594 21.335938 21.332031 21.335938h170.667969v170.664062c0 11.777344 9.558594 21.335938 21.332031 21.335938 11.777344 0 21.335938-9.558594 21.335938-21.335938v-170.664062h170.664062c11.777344 0 21.335938-9.558594 21.335938-21.335938 0-11.773437-9.558594-21.332031-21.335938-21.332031zm0 0" /></svg>
                                        </button>
                                      </div>

                                    <button type="button" class="btn btn-primary btn-sm me-1 mb-2" onclick="removeProduct()" style='margin-left:80px;'>

                                        <i class="fas fa-trash"></i> Remove
                                    </button>
                                </div>
                            </div>
                            <hr class="my-4" />
                        </div>
                    </div>

                    <div class="card mb-4 mb-lg-0">
                        <div class="card-body">
                            <p><strong>We accept</strong></p>
                            <i class="fab fa-cc-visa me-2" style="font-size: 45px; color: #1a1f71;"></i>
                            <i class="fab fa-cc-amex me-2" style="font-size: 45px; color: #007bc1;"></i>
                            <i class="fab fa-cc-mastercard me-2" style="font-size: 45px; color: #eb001b;"></i>
                            <i class="fa fa-credit-card me-2" style="font-size: 45px; color: #003087;"></i>
                            <i class="fab fa-cc-discover me-2" style="font-size: 45px; color: #1a1f71;"></i>
                            <i class="fab fa-cc-jcb me-2" style="font-size: 45px; color: #007bc1;"></i>
                            <i class="fab fa-cc-diners-club me-2" style="font-size: 45px; color: #eb001b;"></i>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card mb-4">
                        <div class="card-header py-3">
                            <h5 class="mb-0">Summary</h5>
                        </div>
                        <div class="card-body">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
                                    Products
                                    <span id="totalPrice" runat="server">Rs.0.00</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                                    (Including GST + Shipping Charges)
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                                    <div>
                                        <strong>Total amount</strong>
                                    </div>
                                    <span id="finalPrice" runat="server">Rs.0.00</span>
                                </li>
                            </ul>
                            <%--<asp:Button ID="btnGoToCheckout" runat="server" Text="Checkout" OnClick="GoToCheckout_Click" CssClass="btn btn-primary" />--%>
                            <div class="container" id="bty">
            <button id="btnGoToCheckout" class="order">
                <span class="default">Complete Order</span>
                <span class="success">
                    Order Placed
                    <svg viewBox="0 0 12 10">
                        <polyline points="1.5 6 4.5 9 10.5 1"></polyline>
                    </svg>
                </span>
                <div class="box"></div>
                <div class="truck">
                    <div class="back"></div>
                    <div class="front">
                        <div class="window"></div>
                    </div>
                    <div class="light top"></div>
                    <div class="light bottom"></div>
                </div>
                <div class="lines"></div>
            </button>
        </div>

        <!-- Hidden ASP.NET Button -->
        <asp:Button ID="btnHiddenSubmit" runat="server" CssClass="d-none" OnClick="GoToCheckout_Click" />

                            <asp:Label ID="errorLabel" runat="server" ForeColor="Red" Visible="False"></asp:Label>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script>
        $(document).ready(function () {
            $('.order').click(function (e) {
                e.preventDefault(); 

                let button = $(this);

                if (!button.hasClass('animate')) {
                    button.addClass('animate');
                    setTimeout(() => {
                        button.removeClass('animate');
                        // Trigger the ASP.NET button click
                        document.getElementById('<%= btnHiddenSubmit.ClientID %>').click();
                }, 8000); 
            }
        });
    });

        function removeProduct() {
            window.location.href = "emptycart.aspx";
        }

        function updateQuantity(updateType) {
            const inputElement = document.getElementById("quantityValue");
            var currentValue = parseInt(inputElement.value);

            if (updateType === "add") {
                inputElement.value = currentValue + 1;
                updatePrice(parseInt(inputElement.value)); 
            } else if (updateType === "minus") {
                if (currentValue > 1) { // Ensure quantity doesn't go below 1
                    inputElement.value = currentValue - 1;
                    updatePrice(parseInt(inputElement.value)); 
                }
            }
            
        }

        function updatePrice(quantity) {
            
            var pricePerUnit = parseFloat(document.getElementById("MainContent_productPrice").textContent.replace('Rs.', '').trim());

            var totalPrice = quantity * pricePerUnit;

            console.log("PRICE => " + totalPrice)

           
            document.getElementById("MainContent_totalPrice").textContent = 'Rs. ' + totalPrice.toFixed(2);
            document.getElementById("MainContent_finalPrice").textContent = 'Rs. ' + totalPrice.toFixed(2);
        }
    </script>



</asp:Content>
