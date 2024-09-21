using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;


namespace NovaCart.html
{
    public partial class checkout : System.Web.UI.Page
    {
        protected int productID; 
        protected int quantity;
        protected decimal productPrice1;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string productIdQueryString = Request.QueryString["ProductID"];

                if (productIdQueryString != null)
                {
                    if (int.TryParse(productIdQueryString, out productID))
                    {
                        ViewState["ProductID"] = productID; // Store in ViewState
                        LoadProductDetails(productID);
                    }
                    else
                    {
                        ShowError("Invalid ProductID format.");
                    }
                }
                else
                {
                    ShowError("ProductID is not available in the query string.");
                }
            }
        }




        private void LoadProductDetails(int productID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = @"
            SELECT ProductName, Model, Price, Imgpath, Description
            FROM Products
            WHERE ProductID = @ProductID";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@ProductID", productID);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        productName.InnerText = reader["ProductName"].ToString();
                        productModel.InnerText = reader["Model"].ToString();
                        productPrice.InnerText = reader["Price"].ToString();
                        productdesc.InnerText = reader["Description"].ToString();
                        productImg.Src = reader["Imgpath"].ToString();

                        productPrice1 = Convert.ToDecimal(reader["Price"]);

                        // Store the product price in ViewState
                        ViewState["ProductPrice1"] = productPrice1;

                        totalPrice.InnerText = productPrice1.ToString("F2");
                        finalPrice.InnerText = productPrice1.ToString("F2");
                    }
                }
            }
        }


        protected void GoToCheckout_Click(object sender, EventArgs e)
        {
            // Retrieve productID from ViewState
            int productID = ViewState["ProductID"] != null ? (int)ViewState["ProductID"] : -1;

            // Retrieve the stored product price from ViewState
            decimal productPrice1 = ViewState["ProductPrice1"] != null ? (decimal)ViewState["ProductPrice1"] : 0;

            // Get the quantity value from form input (default to 1 if not provided)
            int quantity = int.TryParse(Request.Form["quantityValue"], out int qty) ? qty : 1;

            
            decimal finalprice1 = productPrice1 * quantity;

            System.Diagnostics.Debug.WriteLine("Current ProductID in GoToCheckout_Click: " + productID);

            if (productID > 0)
            {               
                bool success = StoreCartDetails(productID, quantity, finalprice1);

                if (success)
                {                    
                    Response.Redirect("payment.aspx?ProductID=" + productID);
                }
                else
                {                    
                    ShowError("Failed to add product to the cart. Please try again.");
                }
            }
            else
            {               
                ShowError("ProductID is not available.");
            }
        }


        private bool StoreCartDetails(int productID,int quantity, decimal finalprice1)
        {
            string connectionString = "Data Source=DELL\\SQLEXPRESS;Initial Catalog=Online_Shopping;Integrated Security=True;";
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string query = @"
                INSERT INTO Cart (ProductID, Quantity, ProductName, Price)
                SELECT @ProductID,@Quantity, ProductName, @Price
                FROM Products 
                WHERE ProductID = @ProductID";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@ProductID", productID);
                        cmd.Parameters.AddWithValue("@Quantity", quantity);
                        cmd.Parameters.AddWithValue("@Price", finalprice1);


                        int rowsAffected = cmd.ExecuteNonQuery();
                        return rowsAffected > 0;
                    }
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        private void ShowError(string message)
        {
            errorLabel.Text = message; 
            errorLabel.Visible = true;
        }
    }
}