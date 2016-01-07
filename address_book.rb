require './contacts'

class AddressBook

  attr_reader :contacts

  def initialize
    @contacts = []
  end


  def print_contact_list
    puts "Contact List:"
    @contacts.each { |contact| puts contact.to_s('last_first') }
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

  def print_results(search, results)
    puts search
    puts ""
    results.each do |contact|
      puts contact.to_s('full_name')
      contact.print_phone_numbers
      contact.print_addresses
      puts ""
    end
  end

end

#####################################

address_book = AddressBook.new

lee = Contact.new
lee.first_name = "Henry"
lee.middle_name = "Lee"
lee.last_name = "Peckage"
lee.add_phone("mobile", "615.573.1234")
lee.add_phone("home", "615.573.2436")
lee.add_address("home", "158 Woodmont Blvd", "", "Nashville", "TN", "37205")
address_book.contacts.push(lee)

shelley = Contact.new
shelley.first_name = "Shelley"
shelley.last_name = "Page"
shelley.add_phone("home", "615-667-1857")
shelley.add_address("home", "1234", "", "Nashville", "AZ", "54321")
address_book.contacts.push(shelley)

# address_book.print_contact_list
address_book.find_by_name("age")
address_book.find_by_phone_number('573')
