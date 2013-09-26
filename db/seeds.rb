# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
User.create(	[
								{email: 'anne-sophie.rouaux@bpi.fr', password: 'password', last_name: 'Rouaux', first_name: 'Anne-Sophie', admin: 1},
								{email: 'olivier.grall@bpi.fr', password: 'password', last_name: 'Grall', first_name: 'Olivier', admin: 1},
								{email: 'laurent.hugou@bpi.fr', password: 'password', last_name: 'Hugou', first_name: 'Laurent', admin: 0},
								{email: 'christelle.joussain@bpi.fr', password: 'password', last_name: 'Joussain', first_name: 'Christelle', admin: 0},
							]
						)

Status.delete_all
Status.create(	[
									{id: 1, name: 'En cours', description: ''}, 
									{id: 2, name: 'Standby', description: ''}, 
									{id: 3, name: 'Monitor', description: ''}, 
									{id: 4, name: 'R&eacute;solu', description: ''}
								]
							)
