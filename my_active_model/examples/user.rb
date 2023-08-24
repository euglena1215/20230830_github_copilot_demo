require_relative '../lib/my_active_model'

class User
  include MyActiveModel::Model

  attribute :name, :string
  attribute :age, :integer
end

user = User.new(name: "Jane", age: 30)
puts "user.valid?: #{user.valid?}"
puts "user: #{user.inspect}"
puts "user.name: #{user.name}"
puts "user.age: #{user.age}"
puts "user.to_h: #{user.to_h}"
