class IncomeCategory < Category
  belongs_to :parent, class_name: self
end
