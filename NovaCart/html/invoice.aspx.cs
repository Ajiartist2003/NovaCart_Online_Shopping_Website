using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;

namespace NovaCart.html
{
    public partial class invoice : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string productID = Request.QueryString["ProductID"];
                string userID = Request.QueryString["UserID"];

                LoadProductDetails(productID);
                LoadUserDetails(userID);

                lblInvoiceID.Text = GenerateInvoiceID();
                lblCreationDate.Text = DateTime.Now.ToString("MMMM dd, yyyy");
            }
        }

        private void LoadProductDetails(string productID)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"
            SELECT p.Model, c.Quantity, p.Price
            FROM Cart c
            JOIN Products p ON c.ProductID = p.ProductID
            WHERE c.ProductID = @ProductID";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@ProductID", productID);
                    con.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            lblProductName.Text = reader["Model"].ToString();
                            int quantity = Convert.ToInt32(reader["Quantity"]);
                            decimal pricePerUnit = Convert.ToDecimal(reader["Price"]);

                            
                            decimal totalPrice = pricePerUnit * quantity;

                            
                            lblProductPrice.Text = pricePerUnit.ToString("F2");  
                            lblQuantity.Text = quantity.ToString();              
                            lblTotalPrice.Text = totalPrice.ToString("F2");      
                        }
                    }

                    con.Close();
                }
            }
        }

        private void LoadUserDetails(string userID)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT First_Name, Last_Name, Address, Phone_Number FROM Users WHERE UserID = @UserID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@UserID", userID);
                    con.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string fullName = reader["First_Name"].ToString() + " " + reader["Last_Name"].ToString();
                            lblUserName.Text = fullName;
                            lblUserAddress.Text = reader["Address"].ToString();
                            lblUserPhone.Text = reader["Phone_Number"].ToString();
                        }
                    }

                    con.Close();
                }
            }
        }

        private string GenerateInvoiceID()
        {
            Random random = new Random();
            return "INV-" + random.Next(1000, 9999).ToString();
        }

        
        protected void DownloadInvoice_Click(object sender, EventArgs e)
        {
            
            MemoryStream memoryStream = new MemoryStream();

            Document document = new Document();
            PdfWriter writer = PdfWriter.GetInstance(document, memoryStream);

            document.Open();

            document.Add(new Paragraph("Invoice ID: " + lblInvoiceID.Text));
            document.Add(new Paragraph("Creation Date: " + lblCreationDate.Text));
            document.Add(new Paragraph("Customer: " + lblUserName.Text));
            document.Add(new Paragraph("Shipping Address: " + lblUserAddress.Text));
            document.Add(new Paragraph("Phone: " + lblUserPhone.Text));
            document.Add(new Paragraph("\nProduct Details:"));
            document.Add(new Paragraph("Product Name: " + lblProductName.Text));
            document.Add(new Paragraph("Price: " + lblProductPrice.Text));
            document.Add(new Paragraph("Quantity" + lblQuantity.Text));
            document.Add(new Paragraph("Total: " + lblTotalPrice.Text));

            document.Close();

            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Invoice_" + lblInvoiceID.Text + ".pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.BinaryWrite(memoryStream.ToArray());
            Response.End();
        }
    }
}