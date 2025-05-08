let cartData = JSON.parse(localStorage.getItem('cart')) || [];

export function addToCart(product) {
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

export function renderCartItems() {
    const cartItemsContainer = document.getElementById('cart-items');
    if (cartItemsContainer) {
        cartItemsContainer.innerHTML = '';

        cartData.forEach(item => {
            const cartItem = document.createElement('div');
            cartItem.classList.add('cart-item');

            const image = document.createElement('img');
            image.classList.add('cart-item-image');
            image.src = item.image;
            image.alt = item.name;
            cartItem.appendChild(image);

            const details = document.createElement('div');
            details.classList.add('cart-item-details');
            cartItem.appendChild(details);

            const title = document.createElement('p');
            title.classList.add('cart-item-title');
            title.textContent = item.name;
            details.appendChild(title);

            const price = document.createElement('p');
            price.classList.add('cart-item-price');
            price.textContent = `$${item.price.toFixed(2)}`;
            details.appendChild(price);

            const quantityContainer = document.createElement('div');
            quantityContainer.classList.add('cart-item-quantity');
            details.appendChild(quantityContainer);

            const quantityLabel = document.createElement('label');
            quantityLabel.textContent = 'Quantity:';
            quantityContainer.appendChild(quantityLabel);

            const quantityInput = document.createElement('input');
            quantityInput.type = 'number';
            quantityInput.value = item.quantity;
            quantityInput.min = '1';
            quantityInput.addEventListener('input', (event) => updateQuantity(item.id, event.target.value));
            quantityContainer.appendChild(quantityInput);

            const removeButton = document.createElement('button');
            removeButton.classList.add('cart-item-remove');
            removeButton.textContent = 'Remove';
            removeButton.addEventListener('click', () => removeCartItem(item.id));
            details.appendChild(removeButton);

            cartItemsContainer.appendChild(cartItem);
        });
    }

    updateCartSummary();
}

function updateQuantity(itemId, newQuantity) {
    const item = cartData.find(item => item.id === itemId);
    if (item) {
        item.quantity = parseInt(newQuantity, 10) || 1;
        saveCartData();
        renderCartItems();
    }
}

function removeCartItem(itemId) {
    cartData = cartData.filter(item => item.id !== itemId);
    saveCartData();
    renderCartItems();
}

function saveCartData() {
    localStorage.setItem('cart', JSON.stringify(cartData));
}

function updateCartSummary() {
    const cartSummaryContainer = document.getElementById('cart-summary');
    if (cartSummaryContainer) {
        cartSummaryContainer.innerHTML = '';

        const subtotal = calculateSubtotal();
        const cartSubtotal = createSummaryRow('cart-subtotal', 'Subtotal', `$${subtotal.toFixed(2)}`);
        cartSummaryContainer.appendChild(cartSubtotal);

        const cartShipping = createSummaryRow('cart-shipping', 'Shipping', 'FREE');
        cartSummaryContainer.appendChild(cartShipping);

        const cartTotal = createSummaryRow('cart-total', 'Total', `$${subtotal.toFixed(2)}`);
        cartSummaryContainer.appendChild(cartTotal);

        const discountForm = document.createElement('div');
        discountForm.classList.add('discount-form');

        const discountInput = document.createElement('input');
        discountInput.type = 'text';
        discountInput.placeholder = 'Discount code';
        discountForm.appendChild(discountInput);

        const applyButton = document.createElement('button');
        applyButton.type = 'button';
        applyButton.textContent = 'Apply';
        applyButton.addEventListener('click', applyDiscount);
        discountForm.appendChild(applyButton);

        cartSummaryContainer.appendChild(discountForm);

        const checkoutButton = document.createElement('button');
        checkoutButton.type = 'button';
        checkoutButton.textContent = 'Checkout';
        checkoutButton.addEventListener('click', handleCheckout);
        cartSummaryContainer.appendChild(checkoutButton);
    }
}

function calculateSubtotal() {
    return cartData.reduce((total, item) => total + item.price * item.quantity, 0);
}

function createSummaryRow(id, label, value) {
    const row = document.createElement('div');
    row.id = id;
    row.classList.add('cart-summary-row');

    const labelElement = document.createElement('span');
    labelElement.textContent = label;
    row.appendChild(labelElement);

    const valueElement = document.createElement('span');
    valueElement.textContent = value;
    row.appendChild(valueElement);

    return row;
}

function applyDiscount() {
    const discountInput = document.querySelector('.discount-form input');
    const discountCode = discountInput.value.trim();

    const lowercaseDiscountCode = discountCode.toLowerCase();

    if (lowercaseDiscountCode === 'ares10off') {
        const subtotal = calculateSubtotal();
        const discountAmount = (subtotal * 10) / 100;
        const discountedTotal = subtotal - discountAmount;

        const cartTotalElement = document.getElementById('cart-total');
        if (cartTotalElement) {
            cartTotalElement.textContent = 'Total ' + `$${discountedTotal.toFixed(2)}`;
            alert("10% OFF DISCOUNT ACQUIRED")
        }
    } else {
        alert('Invalid discount code');
    }
}

function handleCheckout() {
    const cartPrice = document.getElementById('cart-total').innerText;
    window.location.href = "Cart.aspx?cartPrice=" + cartPrice;
    clearCart();
    alert("Success. Thank you for your Purchase");
    window.location.href = "HomePage.aspx";
}

function clearCart() {
    cartData = [];
    saveCartData();
    renderCartItems();
}
