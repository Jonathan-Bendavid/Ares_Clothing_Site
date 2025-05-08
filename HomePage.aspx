
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="HomePage.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="HomeStyle.css" rel="stylesheet" />
    <style>
        .discount-sign {
    background: linear-gradient(to bottom right, #FFC371, #FF5F6D);
    display: flex;
    justify-content: center;
    align-items: center;
    height: 500px;
    position: relative;
    overflow: hidden;
  }
  
  .discount-text {
    text-align: center;
    color: #fff;
    z-index: 1;
  }
  
  .discount-text h2 {
    font-size: 36px;
    margin-bottom: 20px;
  }
  
  .discount-sign::before {
    content: "";
    background: linear-gradient(to bottom right, #FF5F6D, #FFC371);
    position: absolute;
    top: 0;
    left: -200%;
    width: 400%;
    height: 100%;
    transform: skewX(-15deg);
    z-index: 0;
  }
    </style>
    <script>
        function goProduct() {
            window.location.href = "ProductPage.aspx";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="background-colorScheme">
        <br />
    <h3 style="text-align: center; width: 100%; margin-top: 0; margin-bottom: 0;">10% OFF ALL ORDERS</h3>
        <h4 style="text-align: center;margin-top: 0; margin-bottom: 0;">use code ares10off at checkout</h4>
        <br />
        </div>
    <div class="discount-sign">
  <div class="discount-text">
    <h2>Get 10% Off All Orders</h2>
    <a href="ProductPage.aspx" class="ShopNow-btn">Shop Now</a>
  </div>
</div>
    <br />
    <br />
    <table style="width: 100%">
    <tr>
            <th style="font-size: 24px; text-align: center">Shop faster and easier while saving money!</th>
        </tr>
        <tr>
            <th style="width: 100%; text-align: center; font-size: 20px">
                <a href="<%= linkDisplay %>">Sign in or create an account</a>
            </th>
        </tr>
        </table>
    <section class="featured-products">
    <h2>Featured Products</h2>
    <div class="product-grid">
      <div class="product-box">
          <img src="ZuesGymTee/mens-premium-heavyweight-tee-black-back-645a40e13a8f5.png" />
        <h3>Zeus Gym Tee</h3>
        <p>$29.99</p>
      </div>
      <div class="product-box">
        <img src="Ares%20Casual%20Pants/unisex-fleece-sweatpants-black-zoomed-in-64566f1be708e.png" />
        <h3>Casual SweatPants</h3>
        <p>$34.99</p>
      </div>
      <div class="product-box">
          <img src="Hoodie1/unisex-premium-hoodie-carbon-grey-front-64535ba84c284.png" />
        <h3>Casual Hoodie</h3>
        <p>$39.99</p>
      </div>
      <div class="product-box">
          <img src="Ares%20Name%20SweatShirt/unisex-crew-neck-sweatshirt-black-front-645679a125fa2.png" />
        <h3>Essential SweatShirt</h3>
        <p>$34.99</p>
      </div>
        </div>
  </section>
    <div class="background-colorScheme">
    <section class="featured-categories">
    <h2>Featured Categories</h2>
    <div class="category-grid">
      <div class="category-box">
          <img src="SwordAngelShirt/mens-premium-heavyweight-tee-black-back-645a3d60d002c.png" />
        <h3>Gym</h3>
        <button class="ShopNow-btn" onclick="return goProduct()">Shop now
          </button>
      </div>
      <div class="category-box">
          <img src="EssentialTees/mens-premium-heavyweight-tee-black-front-645a3c9d28ca7.png" />
        <h3>Essential</h3>
        <button class="ShopNow-btn" onclick="return goProduct()">Shop now
          </button>
      </div>
      <div class="category-box">
          <img src="Ares%20Casual%20Pants/unisex-fleece-sweatpants-black-zoomed-in-64566f1be708e.png" />
        <h3>Casual</h3>
          <button class="ShopNow-btn" onclick="return goProduct()">Shop now
          </button>
      </div>
    </div>
  </section>
        </div>
    <section class="essentials">
    <h2>Essentials</h2>
    <div class="product-grid">
      <div class="product-box">
          <img src="EssentialTees/mens-premium-heavyweight-tee-black-front-645a3c9d28ca7.png" />
        <h3>Essential Tee</h3>
        <p>$29.99</p>
      </div>
      <div class="product-box">
          <img src="Essential%20Hoodie/unisex-heavy-blend-hoodie-black-front-645a471635c2c.png" />
        <h3>Essential Hoodie</h3>
        <p>$39.99</p>
      </div>
      <div class="product-box">
          <img src="EssentialLongTee/mens-fitted-long-sleeve-shirt-black-front-645a43ba8f473.png" />
        <h3>Essential Long Tee</h3>
        <p>$34.99</p>
      </div>
      <div class="product-box">
        <img src="Ares%20Name%20SweatShirt/unisex-crew-neck-sweatshirt-black-front-645679a125fa2.png" />
        <h3>Essential SweatShirt</h3>
        <p>$39.99</p>
      </div>
    </div>
  </section>
    
</asp:Content>
