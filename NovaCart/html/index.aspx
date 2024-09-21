<%@ Page Language="C#" MasterPageFile="../html/main.master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="NovaCart.html.index" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <title>NovaCart | Home</title>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <style>
        .carousel-item img {
            object-fit: cover; 
            width: 100%;
            height: 100%;
        }
        
    </style>

    <h1>Welcome to NovaCart</h1>
    <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="../images/sale.jpg" class="d-block w-100" alt="Wild Landscape" />
                
            </div>
            <div class="carousel-item">
                <img src="../images/laptop.png" class="d-block w-100" alt="Exotic Fruits" />
                
            </div>
            <div class="carousel-item">
                <img src="../images/homes.jpg" class="d-block w-100" alt="Camera" />
                
            </div>
            <div class="carousel-item">
                <img src="../images/books.jpg" class="d-block w-100" alt="Books" />
                
            </div>
            
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    <h1 align="center"> Our Products</h1>

      <br><br>

  <div class="row">
    <div class="col-md-4 col-sm-4 mi-go wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.6s">
      <div class="goodnesssec buttermilk smbg">
          <a href="#" id="sss" data-bs-toggle="popover" data-bs-trigger="hover" data-bs-placement="top" data-bs-title="Description"  data-bs-content="Discover the latest mobile phones with advanced features like high-speed performance, powerful cameras, and long-lasting batteries. Shop from a wide range of brands and models to find the perfect mobile that suits your needs and budget.">
              <div class="goodnessseccont text-center">
                  <img src="../Uploads/realme.png" alt="" height="300px" width="350px" class="img-responsive center-block">
                  <p class="mlkpro">Mobiles</p>
              </div>
          </a>
     </div>
    </div>
    <div class="col-md-4 col-sm-4 mi-go wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.6s">
      <div class="goodnesssec buttermilk curdbgpro">
        <a href="#" data-bs-toggle="popover" data-bs-trigger="hover" data-bs-placement="top" data-bs-title="Description" data-bs-content="Explore a variety of laptops designed for work, study, and entertainment. With powerful processors, sleek designs, and long battery life, find the perfect laptop that meets your performance and budget needs.">
          <div class="goodnessseccont text-center"  >
            <img src="../Uploads/acer.jpg" alt="" height="300px" width="350px" class="img-responsive center-block">
            <p class="mlkpro">Laptops</p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-md-4 col-sm-4 mi-go wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.6s">
      <div class="goodnesssec buttermilk buttermilk">
        <a href="#" data-bs-toggle="popover" data-bs-trigger="hover" data-bs-placement="top" data-bs-title="Description" data-bs-content="Shop for high-quality speakers that deliver clear and powerful sound. Whether for home, office, or outdoor use, find a range of portable and wireless speakers to enhance your audio experience.">
          <div class="goodnessseccont text-center">
            <img src="../Uploads/speaker2.jpeg" alt="" height="300px" width="350px" class="img-responsive center-block">
            <p class="mlkpro">Speakers</p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-md-4 col-sm-4 mi-go wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.6s">
      <div class="goodnesssec buttermilk buttermilk">
        <a href="#" data-bs-toggle="popover" data-bs-trigger="hover" data-bs-placement="top" data-bs-title="Description" data-bs-content="Enhance your style and tech with a variety of accessories. From trendy jewelry and stylish bags to useful gadgets and tech add-ons, find the perfect finishing touches to complement your look and lifestyle.">
          <div class="goodnessseccont text-center">
            <img src="../Uploads/smartwatch1.jpg" alt="" height="300px" width="350px" class="img-responsive center-block">
            <p class="mlkpro">Accessories</p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-md-4 col-sm-4 mi-go wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.6s">
      <div class="goodnesssec buttermilk buttermilk">
        <a href="#" data-bs-toggle="popover" data-bs-trigger="hover" data-bs-placement="top" data-bs-title="Description" data-bs-content="Capture high-quality photos and videos with a range of cameras, from compact point-and-shoots to advanced DSLRs and mirrorless models. Find the perfect camera to enhance your photography experience and creativity.">
          <div class="goodnessseccont text-center">
            <img src="../Uploads/canon.png" alt="" height="300px" width="350px" class="img-responsive center-block">
            <p class="mlkpro">Cameras</p>
          </div>
        </a>
      </div>
    </div>
    
    <div class="col-md-4 col-sm-4 mi-go wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.6s">
      <div class="goodnesssec buttermilk buttermilk">
        <a href="#" data-bs-toggle="popover" data-bs-trigger="hover" data-bs-placement="top" data-bs-title="Description" data-bs-content="Enjoy stunning visuals and immersive sound with the latest televisions. Available in various sizes and resolutions, including 4K and Smart TVs, these models enhance your viewing experience with advanced features and connectivity options.">
          <div class="goodnessseccont text-center">
            <img src="../Uploads/sony tvvvv.jpg" alt="" height="300px" width="350px" class="img-responsive center-block">
            <p class="mlkpro">Television</p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-md-4 col-sm-4 mi-go wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.6s">
      <div class="goodnesssec buttermilk buttermilk">
        <a href="#" data-bs-toggle="popover" data-bs-trigger="hover" data-bs-placement="top" data-bs-title="Description" data-bs-content="Make laundry day easier with efficient washing machines. Choose from front-load or top-load models featuring various wash programs, energy-saving options, and large capacities to handle all your laundry needs.">
          <div class="goodnessseccont text-center">
            <img src="../Uploads/bosch_washingmachine.png" alt="" height="300px" width="350px" class="img-responsive center-block">
            <p class="mlkpro">Washing Machines</p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-md-4 col-sm-4 mi-go wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.6s">
      <div class="goodnesssec buttermilk buttermilk">
        <a href="#" data-bs-toggle="popover" data-bs-trigger="hover" data-bs-placement="top" data-bs-title="Description" data-bs-content="Keep your food fresh and organized with modern refrigerators. Available in various sizes and styles, these energy-efficient appliances offer advanced cooling technology, spacious storage, and smart features to suit any kitchen.">
          <div class="goodnessseccont text-center">
            <img src="../Uploads/samsung fridge.jpg" alt="" height="300px" width="350px" class="img-responsive center-block">
            <p class="mlkpro">Refridgerators</p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-md-4 col-sm-4 mi-go wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.6s">
      <div class="goodnesssec buttermilk buttermilk">
        <a href="#" data-bs-toggle="popover" data-bs-trigger="hover" data-bs-placement="top" data-bs-title="Description" data-bs-content="Stay cool and comfortable with energy-efficient air conditioners. Choose from a variety of models, including split, window, and portable units, designed to provide quick and effective cooling for any room size.">
          <div class="goodnessseccont text-center">
            <img src="../Uploads/samsung_ac.png" alt="" height="300px" width="350px" class="img-responsive center-block">
            <p class="mlkpro">Air Conditioner</p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-md-4 col-sm-4 mi-go wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.6s">
      <div class="goodnesssec buttermilk buttermilk">
        <a href="#" data-bs-toggle="popover" data-bs-trigger="hover" data-bs-placement="top" data-bs-title="Description" data-bs-content="Upgrade your home with smart appliances that offer convenience and efficiency. From smart refrigerators to automated vacuum cleaners, these devices connect to your home network, making everyday tasks easier and more energy-efficient.">
          <div class="goodnessseccont text-center">
            <img src="../Uploads/hav wh1.jpg" alt="" height="300px" width="350px" class="img-responsive center-block">
            <p class="mlkpro">Smart Appliances</p>
          </div>
        </a>
      </div>
    </div>
      <div class="col-md-4 col-sm-4 mi-go wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.6s">
  <div class="goodnesssec buttermilk buttermilk">
    <a href="#" data-bs-toggle="popover" data-bs-trigger="hover" data-bs-placement="top" data-bs-title="Description" data-bs-content="Discover a wide selection of books across genres and topics. From bestsellers and classic literature to educational and reference materials, find the perfect book to read, learn, and enjoy.">
      <div class="goodnessseccont text-center">
        <img src="../Uploads/book5.jpg" alt="" height="300px" width="350px" class="img-responsive center-block">
        <p class="mlkpro">Books</p>
      </div>
    </a>
  </div>
</div>
<div class="col-md-4 col-sm-4 mi-go wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.6s">
  <div class="goodnesssec buttermilk buttermilk">
    <a href="#" data-bs-toggle="popover" data-bs-trigger="hover" data-bs-placement="top" data-bs-title="Description" data-bs-content="
     Explore a diverse range of magazines covering interests from fashion and technology to health and lifestyle. Stay updated with the latest trends, insights, and articles from your favorite publications.">
      <div class="goodnessseccont text-center">
        <img src="../Uploads/mag1.png" alt="" height="300px" width="350px" class="img-responsive center-block">
        <p class="mlkpro">Magazines</p>
      </div>
    </a>
  </div>
</div>
  </div>

<br><br>

    <script>
  document.addEventListener('DOMContentLoaded', function () {
      const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]');
      const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl));
  });
    </script>


</asp:Content>
