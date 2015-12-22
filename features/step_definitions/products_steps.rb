Then(/^I'll be taken to the product page for "(.*?)"$/) do |product|
  expect(page).to have_content(product)
end

Given(/^I'm on a product page$/) do
  base_model = BaseModel.first
  visit "/products/new?base_model_id=#{base_model.id}"
end
