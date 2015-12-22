def shopping_cart
  if @shopping_cart.nil?
    @shopping_cart = ShoppingCart.find_or_create_by(user_id: customer.id)
  end
  return @shopping_cart
end

def quantity
  @quantity || 8
end

def base_model
  @base_model ||= BaseModel.where('price > ?', 0).take
end

def price
  base_model.price
end

Given(/^I want to purchase more than one of that product$/) do
  select(quantity.to_s, from: 'product_quantity')
end

Given(/^I'm viewing my (non-empty |)shopping cart$/) do |emptiness|
  if emptiness == 'non-empty '
    @product = Product.create(shopping_cart: shopping_cart, quantity: 3, base_model: base_model)
  end
  visit "/shopping_cart"
end

Given(/^I have a shopping cart$/) do
  shopping_cart
end

Given("I have a non-empty shopping cart") do
  @product = Product.create(shopping_cart: shopping_cart, quantity: 3, base_model: base_model)
end

When(/^I change the quantity of a product in my shopping cart$/) do
  bip_select("product_#{@product.id}", :quantity, quantity)
end

When(/^I try to view someone else's shopping cart$/) do
  allow_any_instance_of(ApplicationController).to receive(:current_user)
  @not_my_cart = ShoppingCart.create(user_id: 0)
  page.set_rack_session(cart_id: @not_my_cart.id)
  visit "/shopping_cart"
end

When(/^I try to remove a product from someone else's shopping cart$/) do
  allow_any_instance_of(ApplicationController).to receive(:current_user)
  @not_my_cart = ShoppingCart.create(user_id: 0)
  page.set_rack_session(cart_id: @not_my_cart.id)
  @product = Product.create(shopping_cart: @not_my_cart, quantity: 3, base_model: base_model)
  delete "products/#{@product.id}"
end

When(/^I try to update product quantity in someone else's shopping cart$/) do
  allow_any_instance_of(ApplicationController).to receive(:current_user)
  @not_my_cart = ShoppingCart.create(user_id: 0)
  page.set_rack_session(cart_id: @not_my_cart.id)
  @product = Product.create(shopping_cart: @not_my_cart, quantity: quantity, base_model: base_model)
  put "products/#{@product.id}", {@product.class => { quantity: quantity + 1 } }
end

Then(/^the product added to my cart will have the desired quantity$/) do
  expect(shopping_cart.products.last.quantity).to eql quantity
end

Then(/^the subtotal of my shopping cart will be updated$/) do
  expect(shopping_cart.subtotal.to_f).to eql (price * quantity).to_f
end

Then(/^the product will be removed from my cart$/) do
  expect(shopping_cart.products).to_not include @product
  expect(shopping_cart).to be_empty
  @quantity = 0
end

Then(/^I am redirected home$/) do
  expect(page.current_path).to eql '/'
end

Then(/^the product is not removed from the cart$/) do
  expect(@not_my_cart).to include @product
end

Then(/^that product will be added to my shopping cart$/) do
  expect(shopping_cart.products).to_not be_empty
end

Then(/^no shopping cart is updated$/) do
  expect(@product.quantity).to eql quantity
end
