#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
User.create(	[
								{email: 'marc-andre.grosy@bpi.fr', password: 'password', last_name: 'grosy', first_name: 'marc-André', admin: 1},
								{email: 'olivier.grall@bpi.fr', password: 'password', last_name: 'grall', first_name: 'olivier', admin: 1},
								{email: 'franck.boisnault@bpi.fr', password: 'password', last_name: 'boisnault', first_name: 'franck', admin: 0},
								{email: 'bona.tan@bpi.fr', password: 'password', last_name: 'tan', first_name: 'bona', admin: 0},
								{email: 'mathieu.giral@bpi.fr', password: 'password', last_name: 'giral', first_name: 'mathie', admin: 0},
								{email: 'beatrice.bonneau@bpi.fr', password: 'password', last_name: 'bonneau', first_name: 'beatrice', admin: 0},
								{email: 'laurent.hugou@bpi.fr', password: 'password', last_name: 'Hugou', first_name: 'laurent', admin: 0},
								{email: 'anne-sophie.rouaux@bpi.fr', password: 'password', last_name: 'rouaux', first_name: 'anne-Sophie', admin: 1},
								{email: 'regis.rouet@bpi.fr', password: 'password', last_name: 'rouet', first_name: 'régis', admin: 0},
								{email: 'florence.dumontier@bpi.fr', password: 'password', last_name: 'dumontier', first_name: 'florence', admin: 0},
								{email: 'marc.boilloux@bpi.fr', password: 'password', last_name: 'boilloux', first_name: 'marc', admin: 0},
								{email: 'christelle.joussain@bpi.fr', password: 'password', last_name: 'joussain', first_name: 'christelle', admin: 0},
								{email: 'yann.lebrun@bpi.fr', password: 'password', last_name: 'lebrun', first_name: 'yann', admin: 0},
								{email: 'thomas.joohsen@bpi.fr', password: 'password', last_name: 'joohsen', first_name: 'thomas', admin: 0},
								{email: 'cedric.doe@bpi.fr', password: 'password', last_name: 'doe', first_name: 'cedric', admin: 0},
								{email: 'lorenzo.lamas@bpi.fr', password: 'password', last_name: 'lamas', first_name: 'lorenzo', admin: 0},
								{email: 'robert.laisne@bpi.fr', password: 'password', last_name: 'lesne', first_name: 'robert', admin: 0},
								{email: 'sylvain.leroy@bpi.fr', password: 'password', last_name: 'leroy', first_name: 'sylvain', admin: 0},
								{email: 'philippe.teroitin@bpi.fr', password: 'password', last_name: 'terointin', first_name: 'philippe', admin: 0}
							]
						)

Status.delete_all
Status.create(	[
									{id: 1, name: 'En cours', description: ''}, 
									{id: 2, name: 'Standby', description: ''}, 
									{id: 3, name: 'Monitor', description: ''}, 
									{id: 4, name: 'Résolu', description: ''}
								]
							)
