FactoryGirl.define do
  factory :hrivna, class: 'Currency' do
    title '₴'
    code :UAH
  end

  factory :dollar, class: 'Currency' do
    title '$'
    code :USD
  end
end