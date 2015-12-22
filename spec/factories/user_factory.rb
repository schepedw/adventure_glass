FactoryGirl.define do
  factory :user do
    email 'test@test.com'
    password 'test'
    encrypted_password 'laskdfjal;skjfqwoiuram,.n'
    first_name 'Tester'
    last_name 'Guy'
    phone_number '867-5309'
  end
end
