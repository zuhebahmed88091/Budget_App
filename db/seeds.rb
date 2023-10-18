# db/seeds.rb

# Create users
user1 = User.create(username: 'user1')
user2 = User.create(username: 'user2')

# # Create transaction details
# transaction1 = TransactionDetail.create(name: 'Transaction 1', amount: 100.0, user: user1)
# transaction2 = TransactionDetail.create(name: 'Transaction 2', amount: 200.0, user: user2)

# # Create categories
# category1 = Category.create(name: 'Category 1', icon: 'icon1', amount: 500.0, user: user1)
# category2 = Category.create(name: 'Category 2', icon: 'icon2', amount: 300.0, user: user2)

# # Create category details to associate transactions with categories
# # CategoryDetail.create(category: category1, transaction_detail: transaction1)
# # CategoryDetail.create(category: category2, transaction_detail: transaction2)
# category1.transaction_details << transaction1