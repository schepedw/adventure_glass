Given(/^I am signed in as an admin$/) do
  @customer = User.find_or_initialize_by(first_name: 'Dan', last_name: 'Thystrup', email: 'dan@dan.com')
  ((@customer.password = 'danRawesome') && @customer.save!) unless @customer.persisted?
  @customer.add_role :admin
  step 'I am the current user'
end

Given(/^I am editing a base model(?: that has at least one|)( specification| option|)$/) do |association|
  @base_model = BaseModel.first
  if association.present?
    association.strip!
    instance_variable_set("@#{association}", FactoryGirl.create(association.to_sym, base_model_id: @base_model.id))
  end
  visit "/base_models/#{@base_model.id}/edit"
end

When(/^I update a specification for that base model$/) do
  @new_description = Faker::Lorem.sentence
  bip_text(@specification, :description, @new_description)
  wait_for_ajax
end

When(/^I add a specification for that base model$/) do
  page.find('#add-specification-form-toggle').click
  @new_description = Faker::Lorem.sentence
  fill_in('specification_description', with: @new_description)
  click_button 'Save'
  wait_for_ajax
end

When(/^I remove that specification$/) do
  page.first('#specifications li a').click
  wait_for_ajax
end

When(/^I update the description of that option$/) do
  @new_description = Faker::Lorem.sentence
  bip_text(@option, :description, @new_description)
  wait_for_ajax
end

When(/^I update the price of that option$/) do
  @new_price = Faker::Commerce.price.to_f
  bip_text(@option, :price, @new_price)
  wait_for_ajax
end

When(/^I add a option for that base model$/) do
  @new_price = Faker::Commerce.price.to_f
  @new_description = Faker::Lorem.sentence
  page.find('#add-option-form-toggle').click
  fill_in('option_description', with: @new_description)
  fill_in('option_price', with: @new_price)
  click_button 'Save'
  wait_for_ajax
end

When(/^I remove that option$/) do
  page.first('#options li a').click
  wait_for_ajax
end

When(/^I add a picture$/) do
    pending # express the regexp above with the code you wish you had
end

When(/^I remove a picture$/) do
  @delete_link.find('button').click
  wait_for_ajax
end

Then(/^a picture will be deleted$/) do
  @delete_link = page.first('a.delete-picture')
  picture = URI.decode(@delete_link[:href].split('filename=')[1])
  expect(File).to receive(:delete).with(Rails.root.join('public', 'assets', picture))
end

Then(/^the updated specification will be persisted$/) do
  expect(@specification.reload.description).to eql @new_description
end

Then(/^the new specification will be persisted$/) do
  expect(@base_model.reload.specifications.map(&:description)).to include(@new_description)
end

Then(/^the specifcation is removed$/) do
  expect(Specification).to receive(:delete).with(@specification.id.to_s).and_call_original
end

Then(/^the updated option will be persisted$/) do
  expect(@base_model.reload.available_options).to include(@option)
end

Then(/^the new option will be persisted$/) do
  @option = @base_model.available_options.reload.last
  if @new_price.present?
    expect(@option.price.to_f).to eql @new_price
  end
  if @new_description.present?
    expect(@option.description).to eql @new_description
  end
end

Then(/^that picture will be persisted$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the option is removed$/) do
  expect(Option).to receive(:delete).with(@option.id.to_s).and_call_original
end

Then(/^the base model and associated pictures will be deleted$/) do
  allow(BaseModel).to receive(:find) { @base_model }
  expect(@base_model).to receive(:delete)
  expect(FileUtils).to receive(:rm_rf).with(Rails.root.join('app', 'assets', 'images', @base_model.image_path))
end
