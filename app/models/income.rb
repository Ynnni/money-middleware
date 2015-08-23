class Income < Transaction
  belongs_to :category, class_name: 'IncomeCategory'
end
