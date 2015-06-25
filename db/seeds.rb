# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Student.destroy_all
Instructor.destroy_all
Officer.destroy_all
Course.destroy_all
Submission.destroy_all
Phone.destroy_all
Interview.destroy_all

student_1 = Student.create({f_name: "Student", l_name: "Testberg", email: "s1@test.com", password: "jk", phone_number: "#{FFaker::PhoneNumber.phone_number}" })
student_2 = Student.create({f_name: "Another", l_name: "Estudiante", email: "s2@test.com", password: "jk", phone_number: "#{FFaker::PhoneNumber.phone_number}" })
instructor = Instructor.create({f_name: "Instructor", l_name: "Testman", email: "instructor@test.com", password: "jk", phone_number: "#{FFaker::PhoneNumber.phone_number}" })
officer = Officer.create({f_name: "Officer", l_name: "McTesterson", email: "officer@test.com", password: "jk", phone_number: "#{FFaker::PhoneNumber.phone_number}" })

10.times do
	Student.create({ f_name: "#{FFaker::Name.first_name}", l_name: "#{FFaker::Name.last_name}", email: "#{FFaker::Internet.email}", password: "st", phone_number: "#{FFaker::PhoneNumber.phone_number}" })
end

3.times do
	Instructor.create({f_name: "#{FFaker::Name.first_name}", l_name: "#{FFaker::Name.last_name}", email: "#{FFaker::Internet.email}", password: "in", phone_number: "#{FFaker::PhoneNumber.phone_number}" })
end

2.times do
	Officer.create({f_name: "#{FFaker::Name.first_name}", l_name: "#{FFaker::Name.last_name}", email: "#{FFaker::Internet.email}", password: "of", phone_number: "#{FFaker::PhoneNumber.phone_number}" })
end


wdi = Course.create({subject: "WDI", start_date:"2015-06-23", end_date:"2015-7-31", location:"#{FFaker::Address.city}", price: 10000})
Course.create({subject: "WDI", start_date:"2015-08-01", end_date:"2015-10-31", location:"#{FFaker::Address.city}", price: 10000})

uxi = Course.create({subject: "UXI", start_date:"2015-06-23", end_date:"2015-7-31", location:"#{FFaker::Address.city}", price: 12000})
Course.create({subject: "UXI", start_date:"2015-07-01", end_date:"2015-11-30", location:"#{FFaker::Address.city}", price: 12000})

pmi = Course.create({subject: "PMI", start_date:"2015-06-23", end_date:"2015-7-31", location:"#{FFaker::Address.city}", price: 8000})
Course.create({subject: "PMI", start_date:"2015-08-31", end_date:"2015-10-31", location:"#{FFaker::Address.city}", price: 8000})

pass_phone = Phone.create({q1: 5, q2: 4, q3: 4, q4: 5, q5: 5, notes: "This phone interview went great"})

pass_interview = Interview.create({q1: 3, q2: 4, q3: 4, q4: 4, q5: 4, notes: "This in person interview was fantastic"})

phone_fail = Phone.create({q1: 2, q2: 1, q3: 3, q4: 2, q5: 1, notes: "This person is not qualified. Phone interview was terrible. Doesn't know the difference between a rails migration and a swallow migration."})

Submission.create(student: student_1, course: wdi, status: "accepted", instructor_id: instructor, officer_id: officer, phone_id: pass_phone.id, interview_id: pass_interview.id)

Submission.create(student: student_1, course: uxi, status: "pending-phone")

Submission.create(student: student_2, course: wdi, status: "pending-phone", officer_id: officer)

Submission.create(student: student_2, course: pmi, status: "rejected", officer_id: officer, phone_id: phone_fail.id)

binding.pry

# QUESTIONNAIRE

# Generic_phone = Survey.create(interview: "WDI Phone")
# WDI_person = Survey.create(interview: "WDI Person")
# UXI_person = Survey.create(interview: "UXI Person")
# PMI_person = Survey.create(interview: "PMI Person")

# Generic_phone.questions.create([
# 	{body: "Does the prospective student have critical thinking skills?"},
# 	{body: "Are they comfortable with breaking down a problem?"},
# 	{body: "Are they willing to collaborate with others?"},
# 	{body: "Are they eager to learn about code?"},
# 	{body: "Will they adhere to the school's code of conduct?"}
# ])

# WDI_person.questions.create([
# 	{body: "What is your background?"}, 
# 	{body: "Tell us about a time you had a complex problem and how you solved it."}, 
# 	{body: "Tell us about a time you had to collaborate with a difficult team mate."}, 
# 	{body: "What are your career goals?"}, 
# 	{body: "If you weren't interested in coding, what is your dream job?"}
# ])

# UXI_person.questions.create([
# 	{body: "What is your design background?"},
# 	{body: "How comfortable are you with HTML and CSS?"}, 
# 	{body: "Tell us about a project you had to complete with a fast turn around."}, 
# 	{body: "What are your career goals?"}, 
# 	{body: "If you weren't interested in coding, what is your dream job?"}
# ])

# PMI_person.questions.create([
# 	{body: "What is your managment background?"},
# 	{body: "How comfortable are you working with technical people?"},
# 	{body: "Tell us about a time you had to collaborate with a difficult team mate."},  
# 	{body: "What are your career goals?"}, 
# 	{body: "If you weren't interested in coding, what is your dream job?"}
# ])


