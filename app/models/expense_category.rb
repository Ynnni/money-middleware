class ExpenseCategory < Category
  belongs_to :parent, class_name: self
end
