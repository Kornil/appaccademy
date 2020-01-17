require "employee"

class Startup
  attr_reader :name, :funding, :salaries, :employees

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    @salaries[title] ? true : false
  end

  def >(other)
    @funding > other.funding
  end

  def hire(name, title)
    raise 'An error has occured.' unless valid_title?(title)

    new_employee = Employee.new(name, title)
    @employees << new_employee
  end

  def size
    @employees.length
  end

  def pay_employee(employee)
    throw 'An error has occurred.' if @funding < @salaries[employee.title]
    employee.pay(@salaries[employee.title])
    @funding -= @salaries[employee.title]
  end

  def payday
    @employees.map { |employee| pay_employee(employee) }
  end

  def average_salary
    salaries_sum = 0
    @employees.map { |employee| salaries_sum += @salaries[employee.title] }
    salaries_sum / @employees.length
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(other)
    @funding += other.funding
    @salaries = other.salaries.merge(@salaries)
    @employees += other.employees
    other.close
  end
end
