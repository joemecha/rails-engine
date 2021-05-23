FactoryBot.define do
  factory :customer do
    first_name { Faker::Name.first_name }
    last_name { Faker::Dessert.variety }
  end

  factory :invoice do
    status { "shipped" }
    customer
  end

  factory :merchant do
    name { Faker::Commerce.department }
  end

  factory :item do
    name { Faker::Coffee.variety }
    description { Faker::Hipster.sentence }
    unit_price { Faker::Number.decimal(l_digits: 2) }
    merchant
  end

  factory :transaction do
    credit_card_number { Faker::Finance.credit_card }
    result { [0, 1].sample }
    invoice
  end

  factory :invoice_item do
    quantity { Faker::Number.non_zero_digit }
    unit_price { Faker::Commerce.price }
    status { [0, 1, 2].sample }
    invoice
    item
  end
end
