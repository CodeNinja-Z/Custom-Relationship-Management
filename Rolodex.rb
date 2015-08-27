require_relative('contacts.rb')

class Rolodex
  attr_accessor :contacts, :found
  @@id = 1000

  def initialize
    @contacts = []
  end

  def add_contact(first_name, last_name, email, note)
    contact = Contact.new(@@id, first_name, last_name, email, note)
    @@id += 1
    @contacts << contact
  end

  # alternative of find contact, use method '.find'
  def find_contact_by_id(id)
     @contacts.each do |contact|
        if id == contact.id
          @found = true
          return contact
       end
     end
     @found = false
     puts "There is no record for ID: #{id}"
  end

  def modify_contact(contact_to_modify, attr_to_change, new_value)
    # contact_modify = find_contact_by_id(id)
    if @found == true
      case attr_to_change
        when 1 
          contact_to_modify.first_name = new_value
          puts "First name has been changed!"
          puts
        when 2 
          contact_to_modify.last_name = new_value
          puts "Last name has been changed!"
          puts
        when 3
          contact_to_modify.email = new_value
          puts "Email has been changed!"
          puts
        when 4 
          contact_to_modify.notes = new_value
          puts "Notes has been changed!"
          puts
      end 
    end
  end

  def display_a_contact(id)
    contact_to_display = find_contact_by_id(id)
    if @found == true
      print "ID: #{contact_to_display.id} / Name: #{contact_to_display.full_name} / "
      print "Email: #{contact_to_display.email} / Notes: #{contact_to_display.notes}"
    end
    puts
  end

  def display_all_contacts
    @contacts.each do |contact|
      print "ID: #{contact.id} / Name: #{contact.full_name} /  "
      print "Email: #{contact.email} / Notes: #{contact.notes}"
    end
    puts
  end

  def display_contact_attribute(id)
    contact_attribute = @rolodex.find_contact_by_id(id)

  end
end

#change 'firstname', 'lastname', 'email' or 'notes' by number. You shouldn't be able to change the 'id'.