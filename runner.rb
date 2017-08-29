#require pp styles the output when printed
require 'pp'
#this says use the user class from the local folder.
require_relative 'user'

user = User.new('Samantha', 'example@example.com')

#will outupt the user object with styling
pp user

#saves user using the save method to our user object file
user.save
