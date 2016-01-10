require './contacts'

class AddressBook

  attr_reader :contacts

  def initialize
    @contacts = []
  end

  def run
    loop do
      puts "Address Book"
      puts "a: Add Contact"
      puts "p: Print Address Book"
      puts "s: Search"
      puts "e: exit"
      print "Enter your choice: "
      input = gets.chomp.downcase
      case input
      when 'a'
        add_contact
      when 'p'
        print_contact_list
      when 's'
        print "Search term: "
        search = gets.chomp
        find_by_name(search)
        find_by_address(search)
        find_by_phone_number(search)
      when 'e'
        break
      end
    end
  end

  def add_contact
    contact = Contact.new
    print "First Name: "
    contact.first_name = gets.chomp
    print "Middle Name: "
    contact.middle_name = gets.chomp
    print "Last Name: "
    contact.last_name = gets.chomp

        loop do
          puts "Add phone number or address? "
          puts "p: Add phone number"
          puts "a: Add address"
          puts "(Press any other key to go back)"
          response = gets.chomp
          case response
          when 'p'
            phone = PhoneNumber.new
            print "Kind of phone number (home, work, etc.): "
            phone.kind = gets.chomp
            print "Number: "
            phone.number = gets.chomp
            contact.phone_numbers << phone
          when 'a'
            address = Address.new
            print "Kind of address (home, work, etc.): "
            address.kind = gets.chomp
            print "Address line 1: "
            address.street_1 = gets.chomp
            print "Address line 2:  "
            address.street_2 = gets.chomp
            print "City: "
            address.city = gets.chomp
            print "State: "
            address.state = gets.chomp
            print "Zip: "
            address.zip = gets.chomp
            contact.addresses << address
          else
            print "\n"
            break
          end
        end
    contacts << contact
  end

  def print_contact_list
    puts ""
    puts "Contact List:"
    @contacts.each { |contact| puts contact.to_s('last_first') }
    puts "\n"
  end


####### search functionality

  def find_by_name(name)
    results = []
    search = name.downcase
    contacts.each do |contact|
      if contact.full_name.downcase.include?(search)
        results << contact
      end
    end
    print_results("Search Results for '#{name}': ", results)
    puts ""

  end

  def find_by_phone_number(number)

    results = []
    search = number.gsub("-", "").gsub(".", "")
    contacts.each do |contact|
      contact.phone_numbers.each do |phone_number|
        if phone_number.number.gsub("-", "").gsub(".", "").include?(search)
          results << contact unless results.include?(contact)
        end
      end
    end
    print_results("Search Results for '#{number}'", results)
    puts ""
  end

  def find_by_address(query)
    results = []
    search = query.downcase

    contacts.each do |contact|
      contact.addresses.each do |address|
        if address.to_s('long').downcase.include?(search)
          results << contact unless results.include?(contact)
        end
      end
    end
    print_results("Search Results for '#{query}': ", results)
  end

  def print_results(search, results)
    puts search
    puts ""
    results.each do |contact|
      puts contact.to_s('full_name')
      contact.print_phone_numbers
      contact.print_addresses
      puts "\n"
    end
  end

end

#####################################

address_book = AddressBook.new
address_book.run
