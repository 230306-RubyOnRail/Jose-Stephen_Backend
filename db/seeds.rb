# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# user_name
# first_name
# last_name
# password_digest
# role
# email 
User.create([
    {user_name: "jamesj121212", first_name: 'James', last_name: 'Johnson', email: 'james@johnson.com', password:'password1', role:true},
    {user_name: "alex987", first_name: 'Alex', last_name: 'Anderson', email: 'alxex@anderson.com', password:'password10', role:false}
])

# amount
# description
# status
# user_id
# insert into reimbursements (client_id, amount, created_at, status, reason) values 
Reimbursement.create([
    {amount:20.00, description:'reimbusement for tolls', status:'recieved', user_id:"1"},
    {amount:30.00, description:'reimbusement for food', status:'recieved', user_id:"2"}
])