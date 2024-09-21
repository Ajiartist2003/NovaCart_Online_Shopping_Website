using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;

namespace NovaCart.html
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string userName = TextBox11.Text.Trim();
            string password = TextBox12.Text.Trim();

            // Validate data
            if (string.IsNullOrEmpty(userName) || string.IsNullOrEmpty(password))
            {
                ShowError("Please enter both username and password.");
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["MyDatabaseConnectionString"]?.ConnectionString;

            if (string.IsNullOrEmpty(connectionString))
            {
                ShowError("Error: Connection string is not defined in the Web.config.");
                return;
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                
                string query = "SELECT Userid,Password, isadmin FROM Users WHERE Username = @Username";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", userName);

                    try
                    {
                        conn.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                string storedPasswordHash = reader["Password"] as string;
                                bool isAdmin = Convert.ToBoolean(reader["isadmin"]);
                                int userId = Convert.ToInt32(reader["Userid"]);



                                // Verify password
                                if (VerifyPassword(password, storedPasswordHash))
                                {
                                    Session["Username"] = userName;
                                    Session["UserID"] = userId;

                                    // Check if the user is admin or regular user
                                    if (isAdmin)
                                    {                                       
                                        Response.Redirect("admin.aspx");
                                    }
                                    else
                                    {                                      
                                        Response.Redirect("Index.aspx");
                                    }
                                }
                                else
                                {
                                    ShowError("Invalid username or password.");
                                }
                            }
                            else
                            {
                                ShowError("Invalid username or password.");
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        ShowError($"Error: {ex.Message}");
                    }
                }
            }
        }

        private void ShowError(string message)
        {
            
            ErrorMessage.Text = message; 
        }

        private bool VerifyPassword(string enteredPassword, string storedPasswordHash)
        {
           
            return enteredPassword == storedPasswordHash; 
        }
    }
}
