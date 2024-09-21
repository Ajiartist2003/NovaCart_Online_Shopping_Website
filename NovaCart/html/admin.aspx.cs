using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NovaCart.html
{
    public partial class admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit1_Click(object sender, EventArgs e)
        {
            
            
        }

        // Get Product Details by Product Name
        protected void btndetails_Click(object sender, EventArgs e)
        {
            string productName = txtProductName1.Text.Trim();
            string model = txtmodel.Text.Trim();

            string connectionString = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"]?.ConnectionString;
            if (string.IsNullOrEmpty(connectionString))
            {
                Response.Write("Error: Connection string is not defined in the Web." +
                    "config.");
                return;
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT ProductName, Category, Model, Price, Imgpath, Description, Quantity " +
                               "FROM Products WHERE Model = @Model";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Model", model);

                    try
                    {
                        conn.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.Read())
                        {
                            txtProductName1.Text = reader["ProductName"].ToString();
                            ddlCategory1.SelectedValue = reader["Category"].ToString();
                            txtmodel.Text = reader["Model"].ToString();
                            txtPrice1.Text = reader["Price"].ToString();
                            txtDescription.Text = reader["Description"].ToString();
                            txtQuantity.Text = reader["Quantity"].ToString();
                        }
                        else
                        {
                            string script = "alert('Product not found.');";
                            ClientScript.RegisterStartupScript(this.GetType(), "ProductNotFound", script, true);
                        }
                    }
                    catch (Exception ex)
                    {
                        string script = $"alert('Error: {ex.Message}');";
                        ClientScript.RegisterStartupScript(this.GetType(), "ErrorAlert", script, true);
                    }
                }
            }
        }

        // Update Product Details
        protected void btnupdate_Click(object sender, EventArgs e)
        {
            string productName = txtProductName1.Text.Trim();
            string category = ddlCategory1.SelectedValue;
            string model = txtmodel.Text.Trim();
            decimal price;
            decimal.TryParse(txtPrice1.Text.Trim(), out price);
            string description = txtDescription.Text.Trim();
            int quantity;
            int.TryParse(txtQuantity.Text.Trim(), out quantity);

            string connectionString = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"]?.ConnectionString;
            if (string.IsNullOrEmpty(connectionString))
            {
                Response.Write("Error: Connection string is not defined in the Web.config.");
                return;
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "UPDATE Products SET Category = @Category, ProductName = @ProductName, Price = @Price, " +
                               "Description = @Description, Quantity = @Quantity WHERE  Model = @Model";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Category", category);
                    cmd.Parameters.AddWithValue("@Model", model);
                    cmd.Parameters.AddWithValue("@Price", price);
                    cmd.Parameters.AddWithValue("@Description", description);
                    cmd.Parameters.AddWithValue("@Quantity", quantity);
                    cmd.Parameters.AddWithValue("@ProductName", productName);

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        string script = "alert('Product updated successfully.');";
                        ClientScript.RegisterStartupScript(this.GetType(), "ProductUpdated", script, true);
                    }
                    catch (Exception ex)
                    {
                        string script = $"alert('Error: {ex.Message}');";
                        ClientScript.RegisterStartupScript(this.GetType(), "ErrorAlert", script, true);
                    }
                }
            }
        }

        // Remove Product
        protected void btnremove_Click(object sender, EventArgs e)
        {
            string productName = txtProductName1.Text.Trim();
            string model = txtmodel.Text.Trim();

            string connectionString = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"]?.ConnectionString;
            if (string.IsNullOrEmpty(connectionString))
            {
                Response.Write("Error: Connection string is not defined in the Web.config.");
                return;
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Products WHERE Model = @Model";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Model", model);

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        string script = "alert('Product removed successfully.');";
                        ClientScript.RegisterStartupScript(this.GetType(), "ProductRemoved", script, true);
                    }
                    catch (Exception ex)
                    {
                        string script = $"alert('Error: {ex.Message}');";
                        ClientScript.RegisterStartupScript(this.GetType(), "ErrorAlert", script, true);
                    }
                }
            }
        }

        protected void btnSubmit1_Click1(object sender, EventArgs e)
        {
            string productName = txtProductName1.Text.Trim();
            string category = ddlCategory1.SelectedValue;
            string model = txtmodel.Text.Trim();
            decimal price;
            decimal.TryParse(txtPrice1.Text.Trim(), out price);
            string description = txtDescription.Text.Trim();
            int quantity;
            int.TryParse(txtQuantity.Text.Trim(), out quantity);


            string imageUrl = null;
            if (fuImage.HasFile)
            {

                string fileName = Path.GetFileName(fuImage.FileName);
                string filePath = Server.MapPath("~/Uploads/" + fileName); 
                fuImage.SaveAs(filePath);

                imageUrl = "/Uploads/" + fileName;

                string connectionString = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"]?.ConnectionString;

                if (string.IsNullOrEmpty(connectionString))
                {
                    Response.Write("Error: Connection string is not defined in the Web.config.");
                    return;
                }

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO Products (ProductName, Category, Model, Price, Imgpath, Description, Quantity) " +
                                   "VALUES (@ProductName, @Category, @Model, @Price, @Imgpath, @Description, @Quantity)";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@ProductName", productName);
                        cmd.Parameters.AddWithValue("@Category", category);
                        cmd.Parameters.AddWithValue("@Model", model);
                        cmd.Parameters.AddWithValue("@Price", price);
                        cmd.Parameters.AddWithValue("@Imgpath", imageUrl);
                        cmd.Parameters.AddWithValue("@Description", description);
                        cmd.Parameters.AddWithValue("@Quantity", quantity);

                        try
                        {
                            conn.Open();
                            cmd.ExecuteNonQuery();
                            string script = "alert('Product added successfully.');";
                            ClientScript.RegisterStartupScript(this.GetType(), "ProductAdded", script, true);


                            // Clear input fields
                            txtProductName1.Text = string.Empty;
                            ddlCategory1.SelectedIndex = 0; 
                            txtmodel.Text = string.Empty;
                            txtPrice1.Text = string.Empty;
                            txtDescription.Text = string.Empty;
                            txtQuantity.Text = string.Empty;
                            fuImage.Attributes.Clear(); 
                        }
                        catch (Exception ex)
                        {
                            string script = $"alert('Error: {ex.Message}');";
                            ClientScript.RegisterStartupScript(this.GetType(), "ErrorAlert", script, true);
                        }

                    }
                }
            }
        }
    }
}
