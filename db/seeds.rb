# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


jerome = User.create(name: "Jerome Allouche", career: "actor", height: 6, weight: 140, hair_color: "brown", gender: "male", email: "jerry@al.com", password: "jerome123", password_confirmation: "jerome123")
stephanie = User.create(name: "Stephanie Daffara", career: "actor", height: 5, weight: 120, hair_color: "brown", gender: "female", email: "ste.daff@gmail.com", password: "stephanie123", password_confirmation: "stephanie123")
herbert = User.create(name: "Herb Sneider", career: "actor", height: 6, weight: 190, hair_color: "red", gender: "male", email: "herb@google.com", password: "jerome123", password_confirmation: "jerome123")
margaret = User.create(name: "Margaert Porch", career: "actor", height: 5, weight: 90, hair_color: "blonde", gender: "female", email: "ste.daff@gmail.com", password: "stephanie123", password_confirmation: "stephanie123")
