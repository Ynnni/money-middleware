class Expense < Transaction
  belongs_to :category, class_name: 'ExpenseCategory'
end