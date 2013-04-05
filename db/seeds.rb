# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


member = Member.create email: "jolly@jolly2.com", password: "12345678"

event = Event.create title: "Geneeh event", description: "hello Geneeh", data: Time.now
event1 = Event.create title: "IT event", description: "hello IT", data: Time.now