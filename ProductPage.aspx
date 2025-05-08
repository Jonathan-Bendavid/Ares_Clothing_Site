 <%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductPage.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="Cart.js" type="module"></script>
    <link href="ProductPage.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="filter">
        <tr>
            <td><a href="#" data-gender="all" class="selected">All</a></td>
            <td><a href="#" data-gender="men">Men</a></td>
            <td><a href="#" data-gender="women">Women</a></td>
        </tr>
    </table>

    <br />
    <br />
    <div class="display-product">
        <section class="product-grid">
            <div id="the-products"></div>
        </section>
    </div>

    <script type="module">
        import { products } from './Products.js';

        const productGrid = document.querySelector('.product-grid');
        const genderLinks = document.querySelectorAll('.filter a');
        let cartData = JSON.parse(localStorage.getItem('cart')) || [];

        function createProductCard(product) {
            const card = document.createElement('article');
            card.classList.add('product-card');
            card.dataset.gender = product.gender;

            const imageContainer = document.createElement('div');
            imageContainer.classList.add('image-container');
            card.appendChild(imageContainer);

            const image = document.createElement('img');
            image.src = product.image;
            image.alt = product.name;
            imageContainer.appendChild(image);

            const info = document.createElement('div');
            info.classList.add('info');
            card.appendChild(info);

            const name = document.createElement('h3');
            name.textContent = product.name;
            info.appendChild(name);

            const price = document.createElement('p');
            price.classList.add('price');
            price.textContent = `$${product.price.toFixed(2)}`;
            info.appendChild(price);

            const button = document.createElement('button');
            button.textContent = 'Add to Cart';
            button.addEventListener('click', () => addToCart(product));
            info.appendChild(button);

            return card;
        }

        function getFilteredProducts(products, gender) {
            if (!gender || gender === 'all') {
                return products;
            }
            return products.filter(product => product.gender === gender || product.gender === 'all');
        }

        function renderProducts(products) {
            const fragment = document.createDocumentFragment();
            products.forEach(product => {
                const card = createProductCard(product);
                fragment.appendChild(card);
            });
            productGrid.innerHTML = '';
            productGrid.appendChild(fragment);
        }

        function applyFilters() {
            const selectedGender = document.querySelector('.filter a.selected').dataset.gender;
            const filteredProducts = getFilteredProducts(products, selectedGender);
            renderProducts(filteredProducts);
        }

        function addToCart(product) {
            const existingCartItem = cartData.find(item => item.id === product.id);

            if (existingCartItem) {
                existingCartItem.quantity++;
            } else {
                const newCartItem = {
                    id: product.id,
                    name: product.name,
                    image: product.image,
                    price: product.price,
                    quantity: 1
                };
                cartData.push(newCartItem);
            }

            saveCartData();
            renderCartItems();
        }

        function saveCartData() {
            localStorage.setItem('cart', JSON.stringify(cartData));
        }

        function renderCartItems() {
            const cartItemsContainer = document.getElementById('cart-items');
            if (cartItemsContainer) {
                cartItemsContainer.innerHTML = '';

                cartData.forEach(item => {
                    const cartItem = document.createElement('div');
                    cartItem.classList.add('cart-item');

                    const image = document.createElement('img');
                    image.src = item.image;
                    image.alt = item.name;
                    cartItem.appendChild(image);

                    const name = document.createElement('p');
                    name.textContent = item.name;
                    cartItem.appendChild(name);

                    const price = document.createElement('p');
                    price.textContent = `$${item.price.toFixed(2)}`;
                    cartItem.appendChild(price);

                    const quantity = document.createElement('p');
                    quantity.textContent = `Quantity: ${item.quantity}`;
                    cartItem.appendChild(quantity);

                    cartItemsContainer.appendChild(cartItem);
                });
            }
        }

        genderLinks.forEach(link => {
            link.addEventListener('click', function (event) {
                event.preventDefault();
                genderLinks.forEach(link => link.classList.remove('selected'));
                this.classList.add('selected');
                applyFilters();
            });
        });

        document.addEventListener('DOMContentLoaded', () => {
            renderProducts(getFilteredProducts(products, 'all'));
            renderCartItems();
        });
    </script>
</asp:Content>
