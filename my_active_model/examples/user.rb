require_relative '../lib/my_active_model'

class User
  include MyActiveModel::Model

  attribute :name
  attribute :age
end

user = User.new(name: "Jane", age: 30)
puts "user: #{user.inspect}"
puts "user.name: #{user.name}"
puts "user.age: #{user.age}"