# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Create a screening type
phq9 = ScreeningType.create!(
  name: "PHQ-9",
  description: "Patient Health Questionnaire-9 for depression screening"
)

# Create questions
questions = [
  "Little interest or pleasure in doing things",
  "Feeling down, depressed, or hopeless",
].each_with_index.map do |question, index|
  Question.create!(
    screening_type_id: phq9.id,
    description: question,
    order: index + 1
  )
end

# Create answer options
answer_options = [
  ["Not at all", 0],
  ["Several days", 1],
  ["More than half the days", 2],
  ["Nearly every day", 3]
]

answer_options.each_with_index do |(text, value), index|
  AnswerOption.create!(
    screening_type_id: phq9.id,
    description: text,
    value: value,
    order: index + 1
  )
end
