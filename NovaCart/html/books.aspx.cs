using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NovaCart.html
{
    public partial class books : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string productName = Request.QueryString["productname"];
                LoadProducts(productName);
            }
        }

        private void LoadProducts(string productName = null)
        {
            string connectionString = "Data Source=DELL\\SQLEXPRESS;Initial Catalog=Online_Shopping;Integrated Security=True;";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                string query = "SELECT * FROM Products WHERE Category='Books & Magazines'";
                if (!string.IsNullOrEmpty(productName))
                {
                    query += " AND ProductName = @ProductName";
                }

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    if (!string.IsNullOrEmpty(productName))
                    {
                        cmd.Parameters.AddWithValue("@ProductName", productName);
                    }

                    SqlDataReader reader = cmd.ExecuteReader();
                    productsContainer1.Controls.Clear(); 
                    while (reader.Read())
                    {
                        string productHtml = $@"
                <div class='col-md-6 col-lg-4 mb-4 mb-lg-0 custom-card-size'>
                    <div class='card'>
                        <div class='d-flex justify-content-between p-3'>
                            <h5 class='mb-0'>{reader["ProductName"]}</h5>
                            <div class='bg-info rounded-circle d-flex align-items-center justify-content-center shadow-1-strong'
                                 style='width: 35px; height: 35px;'>
                                <p class='text-white mb-0 small'>x{reader["Quantity"]}</p>
                            </div>
                        </div>
                        <img src='{reader["Imgpath"]}' class='card-img-top custom-card-img' alt='{reader["ProductName"]}' height='350' width='250'  />
                        <div class='card-body'>
                            <div class='d-flex justify-content-between mb-3'>
                                <h5 class='mb-0' style='font-size:0.9em'>{reader["Model"]}</h5>
                                <h5 class='text-dark mb-0' style='font-size:0.9em'>Rs.{reader["Price"]}</h5>
                            </div>
                            <div class='d-flex justify-content-between mb-2'>
                                <p class='text-muted mb-0'>Available: <span class='fw-bold'>{reader["Quantity"]}</span></p>
                                <div class='ms-auto text-warning'>
                                    <i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>
                                    <i class='fa fa-star'></i><i class='fa fa-star'></i>
                                </div>
                            </div>
                            <div class='d-flex justify-content-between mt-3' style='padding-left:65px;'>
                                <a href='checkout.aspx?ProductID={reader["ProductID"]}' class='btn btn-primary'>Buy Now</a>
                                
                            </div>
                        </div>
                    </div>
                </div>";
                        productsContainer1.Controls.Add(new Literal { Text = productHtml });
                    }
                }
            }
        }

    }
}