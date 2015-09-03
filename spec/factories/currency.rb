FactoryGirl.define do
  factory :hrivna, class: 'Currency' do
    name '₴'
    code :UAH
    exchange_rate 23
  end

  factory :currency, aliases: [:dollar], class: 'Currency' do
    name '$'
    code :USD
    exchange_rate 1
  end
end