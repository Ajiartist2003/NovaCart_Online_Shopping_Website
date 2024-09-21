using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NovaCart.html
{
    public partial class payment : System.Web.UI.Page
    {
        protected void CompletePayment_Click(object sender, EventArgs e)
        {
            string productID = Request.QueryString["ProductID"];
            if (Session["UserID"] != null)
            {
                string userID = Session["UserID"].ToString();

                // Retrieve product and user details from the database
                decimal unitPrice = GetProductUnitPrice(productID);
                int quantity = GetProductQuantity(productID);
                string shippingAddress = GetShippingAddress(userID);
                DateTime orderDate = DateTime.Now;

                string connectionString = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    string query = @"
                        INSERT INTO OrderDetails (UserID, ProductID, Quantity, UnitPrice, ShippingAddress, OrderDate)
                        VALUES (@UserID, @ProductID, @Quantity, @UnitPrice, @ShippingAddress, @OrderDate)";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@UserID", userID);
                        cmd.Parameters.AddWithValue("@ProductID", productID);
                        cmd.Parameters.AddWithValue("@Quantity", quantity);
                        cmd.Parameters.AddWithValue("@UnitPrice", unitPrice);
                        cmd.Parameters.AddWithValue("@ShippingAddress", shippingAddress);
                        cmd.Parameters.AddWithValue("@OrderDate", orderDate);
                        cmd.ExecuteNonQuery();
                    }
                }

                string script = "alert('Your payment was successful!'); window.location='invoice.aspx?ProductID=" + productID + "&UserID=" + userID + "';";
                ClientScript.RegisterStartupScript(this.GetType(), "PaymentSuccessAlert", script, true);
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }

        // Method to retrieve product unit price from the database
        private decimal GetProductUnitPrice(string productID)
        {
            decimal unitPrice = 0;
            string connectionString = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT Price FROM Products WHERE ProductID = @ProductID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ProductID", productID);

                con.Open();
                object result = cmd.ExecuteScalar();
                if (result != null)
                {
                    unitPrice = Convert.ToDecimal(result);
                }
            }
            return unitPrice;
        }

        // Method to retrieve product quantity from the database (e.g., from the cart or directly)
        private int GetProductQuantity(string productID)
        {
            int quantity = 0;
            string connectionString = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT Quantity FROM Cart WHERE ProductID = @ProductID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ProductID", productID);

                con.Open();
                object result = cmd.ExecuteScalar();
                if (result != null)
                {
                    quantity = Convert.ToInt32(result);
                }
            }
            return quantity;
        }

        // Method to retrieve the user's shipping address from the database
        private string GetShippingAddress(string userID)
        {
            string shippingAddress = string.Empty;
            string connectionString = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT Address FROM Users WHERE UserID = @UserID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserID", userID);

                con.Open();
                object result = cmd.ExecuteScalar();
                if (result != null)
                {
                    shippingAddress = result.ToString();
                }
            }
            return shippingAddress;
        }
    }
}