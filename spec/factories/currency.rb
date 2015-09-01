FactoryGirl.define do
  factory :hrivna, class: 'Currency' do
    title '₴'
    code :UAH
  end

  factory :currency, aliases: [:dollar], class: 'Currency' do
    title '$'
    code :USD
  end
end