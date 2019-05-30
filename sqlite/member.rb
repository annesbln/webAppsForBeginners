require 'sqlite3'
require 'sequel'

class Member
end

# find a member
member = Member.find(id: 1)
puts "#{member.name} has joined on #{member.joined_on}."

# change the members joined date
member.joined_on = '2019-05-31'
member.save

puts
puts "Correction!"
member = Member.find(id: 1)
puts "#{member.name} has joined on #{member.joined_on}."

# Find several members based on their joined_on date
puts
puts "Who joined on 2013-06-24?"
members = Member.where(joined_on: '2013-06-24')
members.each do |member|
  puts "#{member.name} has joined on #{member.joined_on}."
end