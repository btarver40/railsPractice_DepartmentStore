8.times do
  Department.create(
    name: Faker::Dessert.topping,
  )
end