using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NovaCart
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            // Retrieve form values
            string firstName = TextBox1.Text.Trim();
            string lastName = TextBox2.Text.Trim();
            string email = TextBox3.Text.Trim();
            string userName = TextBox6.Text.Trim();
            string password = TextBox4.Text.Trim();
            string confirmpassword = TextBox5.Text.Trim();
            string phoneNumber = TextBox7.Text.Trim();
            string pinCode = TextBox10.Text.Trim();
            string address = TextBox8.Text.Trim();

            // Validate data
            if (string.IsNullOrEmpty(firstName) || string.IsNullOrEmpty(lastName) ||
                string.IsNullOrEmpty(email) || string.IsNullOrEmpty(userName) ||
                string.IsNullOrEmpty(password) || string.IsNullOrEmpty(phoneNumber) ||
                string.IsNullOrEmpty(pinCode) || string.IsNullOrEmpty(address) ||
                string.IsNullOrEmpty(confirmpassword))
            {
                
                return;
            }

            // Insert data into the database
            string connectionString = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"]?.ConnectionString;

            if (string.IsNullOrEmpty(connectionString))
            {
               
                Response.Write("Error: Connection string is not defined in the Web.config.");
                return;
            }
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Users (First_Name, Last_Name, Email, Username, Password,Confirm_Password, Phone_Number, Pin_Code, Address) " +
                               "VALUES (@First_Name, @Last_Name, @Email, @Username, @Password,@Confirm_Password, @Phone_Number, @Pin_Code, @Address)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@First_Name", firstName);
                    cmd.Parameters.AddWithValue("@Last_Name", lastName);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Username", userName);
                    cmd.Parameters.AddWithValue("@Password", password);
                    cmd.Parameters.AddWithValue("@Confirm_Password", confirmpassword);
                    cmd.Parameters.AddWithValue("@Phone_Number", phoneNumber);
                    cmd.Parameters.AddWithValue("@Pin_Code", pinCode);
                    cmd.Parameters.AddWithValue("@Address", address);

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        
                        Response.Redirect("Login.aspx"); 
                    }
                    catch (Exception ex)
                    {
                        Response.Write($"Error: {ex.Message}");
                    }
                }
            }
        }

        protected void TextBox8_TextChanged(object sender, EventArgs e)
        {

        }
    }
 }
