require "byebug"
class Employee
    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
        @employees = []
    end

    def bonus(multiplier)
        bonus = (salary) * multiplier
    end
    def inspect
        @name.inspect 
    end
    # private 
    attr_reader :name, :title, :salary, :boss, :employees
end

class Manager < Employee 
    def initialize(name, title, salary, boss, employees)
        super(name, title, salary, boss)
        @employees = employees
    end

    def bonus(multiplier)
        total_salary_employees = 0
        queue = employees
        # debugger
        while !queue.empty?
            ele = queue.shift
            total_salary_employees += ele.salary
            queue += ele.employees 
        end
        return total_salary_employees * multiplier
    end
    # private

    attr_reader :name, :title, :salary, :boss, :employees
end

david = Employee.new('David', 'TA', 10000, 'Darren')
shawna = Employee.new('Shawna', 'TA', 12000, 'Darren')
darren = Manager.new('Darren', 'TA Manager', 78000, 'Ned',[david,shawna])
ned = Manager.new('Ned', 'Founder', 1000000, nil, [darren])

p ned.bonus(5)
