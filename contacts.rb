class Contact

  require './phone_number'

  attr_writer :first_name, :middle_name, :last_name
  attr_reader :phone_numbers

  def initialize
    @phone_numbers = []
  end

  def add_phone(kind, number)
    phone_number = PhoneNumber.new
    phone_number.kind = kind
    phone_number.number = number
    phone_numbers.push(phone_number)
  end

  def first_name
    @first_name
  end

  def middle_name
    @middle_name
  end

  def last_name
    @last_name
  end

  def full_name
    full_name = first_name
      if !@middle_name.nil?
        full_name += " "
        full_name += middle_name
      end
        full_name += " "
        full_name += last_name
        full_name
  end

  def last_first
    last_first = last_name
    last_first += ", "
    last_first += first_name
    if !@middle_name.nil?
      last_first += " "
      last_first += middle_name.slice(0, 1)
      last_first += "."
    end
    last_first
  end

  def first_last
    first_name + " " + last_name
  end

  def to_s(format= 'full_name')
    case format
    when 'full_name'
      full_name
    when 'last_first'
      last_first
    when 'first'
      first_name
    when 'last'
      last_name
    else
      first_last
    end
  end

  def print_phone_numbers
    puts "Phone Numbers:"
    phone_numbers.each { |phone| puts phone}
  end

end

lee = Contact.new
lee.first_name = "Harry"
lee.middle_name = "Lee"
lee.last_name = "Page"
lee.add_phone("mobile", "615.573.2436")
lee.add_phone("home", "615.573.2436")
lee.print_phone_numbers
