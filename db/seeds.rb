# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@tierOne = Tier.create(tier: 1, notes: "If an instructor was marked tier 1 then aggregate numbers of student feedback forms did not hit our bench mark numbers, student success managers/regional directors/students/TAs may have complained about an instructor's performance")

@tierTwo = Tier.create(tier: 2, notes: "New Instructors are marked tier 2")

@tierThree = Tier.create(tier: 3, notes: "no red flags")

Rd.create(rd: "Stacey Maresco", rd_email: "smaresco@trilogyed.com")
Rd.create(rd: "Jonathon Medina", rd_email: "jmedina@trilogyed.com")
Rd.create(rd: "James Alexander", rd_email: "jalexander@trilogyed.com")

@rutgers = University.create(university: "Rutgers University", rd_id: 1)
@northwest = University.create(university: "Northwestern", rd_id: 1)
@uncch = University.create(university: "UNC-Chapel Hill", rd_id: 1)
@uncc = University.create(university: "UNC-Charlotte", rd_id: 1)
@uta = University.create(university: "UT Austin", rd_id: 3)
@uta = University.create(university: "UT Austin (Houston)", rd_id: 3)
@ucf = University.create(university: "UCF", rd_id: 2)
@uclae = University.create(university: "UCLA Extension", rd_id: 3)

@analyst = Analyst.create(name: "Dong Son", email: "dson@trilogyed.com")

Instructor.create(university_id: 5, instructor: "Sean Wragg", email: "seanwragg@gmail.com", phone: "305-332-6993", pre_quiz_taken: false)

Instructor.create(university_id: 5, instructor: "David Whittaker", email: "david@davidgwhittaker.com", phone: "386-589-8002", pre_quiz_taken: false)

LessonPlan.create(lp: 1.1, lp_link: "https://github.com/coding-boot-camp/FullStack-Lesson-Plans/tree/master/02-lesson-plans/01-html-css-three-days/1-Class-Content/1.1")

LessonPlan.create(lp: 1.2, lp_link: "https://github.com/coding-boot-camp/FullStack-Lesson-Plans/tree/master/02-lesson-plans/01-html-css-three-days/1-Class-Content/1.2")

LessonPlan.create(lp: 1.3, lp_link: "https://github.com/coding-boot-camp/FullStack-Lesson-Plans/tree/master/02-lesson-plans/01-html-css-three-days/1-Class-Content/1.3")

Ss.create(university_id: 1, ss: "Kalimah Perry", ss_email: "kperry@trilogyed.com")

Ss.create(university_id: 2, ss: "Adrienne O'Leary", ss_email: "adrienne@trilogyed.com")

Ss.create(university_id: 3, ss: "Ilyssa Rosenzweig", ss_email: "irosenzweig@trilogyed.com")

Ss.create(university_id: 4, ss: "Steve CaChat", ss_email: "scachat@trilogyed.com")

Ss.create(university_id: 5, ss: "Brett Payne", ss_email: "brett@trilogyed.com")

Ss.create(university_id: 6, ss: "Caleb Andersh", ss_email: "candersh@trilogyed.com")

Ss.create(university_id: 7, ss: "Ricky Cuellar", ss_email: "rcuellar@trilogyed.com")

Ss.create(university_id: 8, ss: "Alex Garett", ss_email: "agarett@trilogyed.com")

# @lionOne = Lion.create(birthdate: "2015-08-03", name: "broo", about: "brooooo", weight: 333, health: 8, health_notes: "so healthy")
#
# @lionTwo = Lion.create(birthdate: "2015-08-03", name: "brosky", about: "broin out man", weight: 199, health: 9, health_notes: "just chillin")
#
# @lionThree = Lion.create(birthdate: "2015-08-03", name: "Coolawski", about: "totally cool", weight: 180, health: 10, health_notes: "Perfecto ten")
#
# @ltOne = LionTamer.create(name: "Pavan", experience: 8, living: true)
#
# @ltTwo = LionTamer.create(name: "Akira", experience: 99, living: true)
#
# @pOne = Panther.create(name: "Eric", claw_length: 8)
#
# @pTwo = Panther.create(name: "Peter", claw_length: 9)
#
# @catToyOne = CatToy.create(name: "ball", toyable_id: 1, toyable_type: "Lion")
#
# @catToyTwo = CatToy.create(name: "string!", toyable_id: 2, toyable_type: "Panther")
