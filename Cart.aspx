<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="CartStyle.css" rel="stylesheet" />
    <script src="altCart.js" type="module"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="cart-page">
        <div class="cart-container">
            <div class="cart-items" id="cart-items"></div>
            <div class="cart-summary" id="cart-summary">
                <h3>Cart Summary</h3>
                <button onclick="clearCart()">Clear Cart</button>
                <div class="cart-summary-row" id="cart-subtotal">
                    <span>Subtotal</span>
                    <span>$0.00</span>
                </div>
                <div class="cart-summary-row" id="cart-shipping">
                    <span>Shipping</span>
                    <span>FREE</span>
                </div>
                <div class="cart-summary-row" id="cart-total">
                    <span>Total</span>
                    <span>$0.00</span>
                </div>
                <br />
                <button type="button" onclick="return handleCheckout()">Checkout</button>
            </div>
        </div>
    </div> 
    <script type="module">
        import { renderCartItems } from './altCart.js';

        document.addEventListener('DOMContentLoaded', () => {
            renderCartItems();
        });
    </script>
</asp:Content>
