# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Patient.create(name: "Mark Pool")

screener = Screener.create!(name: "PHQ")
question = screener.questions.new
question.prompt = "Little interest or pleasure in doing things?"
question.save!

question = screener.questions.new
question.prompt = "Feeling down, depressed or hopeless?"
question.save!
