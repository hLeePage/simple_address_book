require './contacts'

class AddressBook

  attr_reader :contacts

  def initialize
    @contacts = []
  end

  def find_by_name(name)
    results = []
    search = name.downcase
    contacts.each do |contact|
      if contact.full_name.downcase.include?(search)
        results << contact
      end
    end
    puts "Search Results for '#{name}': "
    puts ""
    results.each do |contact|
      puts contact.to_s('full_name')
      contact.print_phone_numbers
      contact.print_addresses
      puts "\n"
    end
  end

  def print_contact_list
    puts "Contact List:"
    @contacts.each { |contact| puts contact.to_s('last_first') }
  end
end

address_book = AddressBook.new

lee = Contact.new
lee.first_name = "Henry"
lee.middle_name = "Lee"
lee.last_name = "Peckage"
lee.add_phone("mobile", "615.573.2436")
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
