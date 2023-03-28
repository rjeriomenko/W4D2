require_relative "employee"

class Manager < Employee
    attr_reader :employees
    def initialize(name, title, salary, boss, employees)
        super(name, title, salary, boss)
        @employees = employees
    end

    def bonus(multiplier)
        bonus = get_subordinate_salary * multiplier
    end

    def get_subordinate_salary
        employee_salaries = @employees.map do |employee| 
            if !employee.is_a?(Manager)
                employee.salary
            else
                employee.get_subordinate_salary + employee.salary
            end

        end
        employee_salaries.sum
    end

    def create_subordinate(name, title, salary, manager=false, sub_employees=[])
        unless manager
            employee = Employee.new(name, title, salary, self)
            p employee
            @employees << employee
        else
            employee = Manager.new(name, title, salary, self, sub_employees)
            @employees << employee
        end
    end


end

