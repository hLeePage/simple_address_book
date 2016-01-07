class Contact

  attr_writer :first_name, :middle_name, :last_name

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

end

lee = Contact.new
lee.first_name = "Harry"
lee.middle_name = "Lee"
lee.last_name = "Page"

prince = Contact.new
prince.first_name = "Prince"
prince.last_name = "Humperdink"

puts lee.to_s('full_name')
puts lee.to_s('first_last')
puts prince.to_s('last_first')
