require_relative "manager"
require_relative "employee"

#name, title, salary, boss, employees
#create_subordinate(manager = false, name, title, salary, employees)
#name, title, salary, boss
ned = Manager.new("Ned", "Founder", 1, nil, [])
p ned
ned.create_subordinate("Darren", "TA Manager", 78000, true)
darren = ned.employees[0]
darren.create_subordinate("Shawna", "TA", 12000, false)
darren.create_subordinate("David", "TA", 10000, false)
david = darren.employees[-1]

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000