def all_fields
  @all_fields ||= {
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    title: 'Mr.',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone_number: Faker::PhoneNumber.phone_number,
    building_number: Faker::Address.building_number,
    street: Faker::Address.street_name,
    apartment_number: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip_code: Faker::Address.zip
  }
  @all_fields.merge(password_confirmation: @all_fields[:password])
end

def address_fields
  all_fields.slice(*%i[building_number street apt_or_unit_number city state zip_code])
end

def customer_fields
  all_fields.slice(*%i[email password password_confirmation title first_name last_name phone_number])
end

def parse_fields(fields)
  fields.split(',').map{|a| a.strip.gsub(' ', '_').to_sym }
end

Given(/^my customer information is(| not) complete$/) do |incomplete|
  allow(customer).to receive(:registration_complete?) { incomplete.blank? }
  allow_any_instance_of(ApplicationController).to receive(:current_user) { customer }
end

Given(/^I am viewing the confirmation page for my order$/) do
  visit '/checkout/confirm'
end

Given(/^I have a valid shipping address$/) do
  step 'I am the current user'
  @customer.most_recent_shipping_address.update_attributes(address_fields)
end

Given(/^I have logged in$/) do
  step 'I am the current user'
end

Given(/^the information I have already given includes (|[(\S+)(,\s)]+)$/) do |given_fields|
  fields = parse_fields(given_fields)
  next if fields.empty?
  @customer.update_attributes( customer_fields.slice(*fields) )
  @customer.most_recent_shipping_address.update_attributes( address_fields.slice(*fields) )
  @customer.shipping_addresses.reload
  allow(@customer).to receive(:registration_complete?) { false }
end

When(/^I visit the checkout page$/) do
  visit '/checkout'
end

When(/^I enter a new shipping address on the checkout page$/) do
  visit '/checkout'
  @all_fields = nil
  address_fields.each do |field, value|
    page.fill_in("user_shipping_addresses_#{field}", with: value)
  end
  click_button 'Continue to Checkout'
end

Then(/^the ( |[(\S+)(,\s)]+ )fields are pre\-populated$/) do |populated_fields|
  fields = parse_fields(populated_fields)
  customer_fields.slice(*fields).each do |field, value|
    expect(page.find("#user_#{field}").value).to eql value
  end
  address_fields.slice(*fields).each do |field, value|
    expect(page.find("#user_shipping_addresses_#{field}").value).to eql value
  end
end

Then(/^an order will be created$/) do
  expect(Order.find_by_shopping_cart_id(shopping_cart.id)).to_not be_nil
end

Then(/^I will receive an email confirming my order$/) do
  expect(OrderMailer).to receive(:confirm_order).and_call_original
end

Then(/^I will be directed to my order summary page$/) do
  expect(page.current_path).to eql "/orders/#{Order.last.id}"
end

Then(/^I see fields for ([(\S+)(,\s)]+)*$/) do |available_fields|
  available_fields = parse_fields(available_fields)
  customer_fields.slice(*available_fields).values do |field|
    expect(page).to have_content("#user_#{field}")
  end
  address_fields.slice(*available_fields).values do |field|
    expect(page).to have_content("#user_shipping_addresses_#{field}")
  end
end

Then(/^I should see all of the products in my cart$/) do
  shopping_cart.products.each do |product|
    expect(page).to have_content(product.description)
  end
end

Then(/^I should see the product subtotal$/) do
  expect(page).to have_content(shopping_cart.subtotal)
end

Then(/^the product in my cart will have the desired quantity$/) do
  expect(@product.reload.quantity).to eql quantity
end

Then(/^my updated address will be shown on the confirmation page$/) do
  address_fields.values.each do |field|
    expect(page).to have_content field
  end
end

Then(/^I won't see fields for ([(\S+)(,\s)]+)$/) do |fields|
  customer_fields.slice(*fields).values do |field|
    expect(page).to_not have_content("#user_#{field}")
  end
end
