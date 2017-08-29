#this would allow us work with the json file
require 'json'

class User

#set getter and setter through attribute accessor:
  attr_accessor :name, :email, :permissions
#(*args) takes argeuments passed in and creates an array
  def initialize(*args)
    @name = args[0]
    @email = args[1]
    @permissions = User.permissions_from_template
  end

  #create a class method to access the json file and read from it.
  def self.permissions_from_template
    #reads the json file with our permissions
    file = File.read("permissions_template.json")
    #creates a json object from the file we read in. symbolize allows us format the input to look nice, nil means we dont pass in additional options
    JSON.load(file, nil, symbolize_names: false)
  end

 #We need a new method to save the values we read and the new users created to a new file
  def save
    #we create a hash to save the values into:
    new_json = {name: @name, email: @email, permissions: @permissions}.to_json
    #we open a new file and append (a) the new values to it.
    open('users.json', 'a') do |file|
      file.puts new_json
    end

  end



end
