def customer
  if @customer.nil?
    @customer = User.first || User.create(
      email:    'test@test.com',
      password: 'totally_secure'
    )
  end
  @customer
end

Given(/^I am the current user/) do
  visit '/'
  next if page.has_content?('LOG OUT')
  click_link('LOG IN')
  fill_in('user_email', with: customer.email)
  fill_in('user_password', with: customer.password)
  click_button('Log in')
end

Given(/^I have not logged in$/) do
  visit '/'
  next if page.has_content?('LOG IN')
  click_link('LOG OUT')
end

Then(/^I should have no unfound images$/) do
  # ugly way of testing for no missing images. Better way?
  expect(all('img').map(&:has_no_content?).all?(&:!)).to be true
end

When(/^I click (?:on |)(?:the |)["'](.*?)['"](?: button|)$/) do |content|
  click_link(content) if page.has_link?(content)
  if page.has_xpath?("//button[contains(., '#{content}')]")
    page.find(:xpath, "//button[contains(., '#{content}')]").click
  end
  click_button(content) if page.has_button?(content)
end

Then(/^I'll be taken to the "(.*?)" page$/) do |partial_url|
  expect(page.current_url).to match(partial_url)
end
