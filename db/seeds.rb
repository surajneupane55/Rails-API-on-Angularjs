# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
List.create!(description: 'shopping', status: false, task_id: 13, due_date: Date.tomorrow)
 List.create!(description: 'moving', status: false, task_id: 13, due_date: Date.tomorrow)