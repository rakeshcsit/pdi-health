https://trello.com/b/SMm1Mv9y/interview-weekly-v2


https://docs.google.com/spreadsheets/d/1QG8qBT20S-jzn0hIkVQVpngEL__42KU1faRZ34buuoM/edit#gid=96164355
----------------------------------------------------------------------------
https://docs.google.com/spreadsheets/d/1QG8qBT20S-jzn0hIkVQVpngEL__42KU1faRZ34buuoM/edit#gid=1660573333

panopto list

----------------------------------------------------------------------------

KPI Dashboard start with this query

ability to filter the kpis for university, date range (for quarters), region

averages of the last audit for all instructors (should boil this per university)

do this per region as well

**calculate the most improvement from the lowest audit**

  WITH latest_instructors_audits_optimized AS (
    SELECT au.*, 
    (CASE
      WHEN (au.percent_hp_lp = '< 40%') THEN 40
      WHEN (au.percent_hp_lp = '40% to 60%') THEN 50
      WHEN (au.percent_hp_lp = '60% to 80%') THEN 70
      WHEN (au.percent_hp_lp = '80% to 100%') THEN 90
      WHEN (au.percent_hp_lp = '100%') THEN 100
      WHEN (au.percent_hp_lp IS NULL) THEN 0
      ELSE 0
    END) AS hp_lp,
    (CASE
      WHEN (au.percent_lp = '< 40%') THEN 40
      WHEN (au.percent_lp = '40% to 60%') THEN 50
      WHEN (au.percent_lp = '60% to 80%') THEN 70
      WHEN (au.percent_lp = '80% to 100%') THEN 90
      WHEN (au.percent_lp = '100%') THEN 100
      WHEN (au.percent_lp IS NULL) THEN 0
      ELSE 0
    END) AS lp
    FROM audits au
    WHERE id IN (SELECT au.id
    FROM audits au LEFT JOIN audits au2
     ON (au.instructor_id = au2.instructor_id AND au.id < au2.id)
    WHERE au2.id IS NULL)
  )
  select AVG(engage_num) as engage_avg, AVG(vocal_enc_num) as vocal_enc_avg, AVG(mean_quest_num) as mean_quest_avg, AVG(discuss_num) as discuss_avg, AVG(overall_num) as overall_avg, AVG(lp) as lp_avg, AVG(hp_lp) as hp_lp_avg from latest_instructors_audits_optimized;

instructors that have never gotten an audit:

  select * from instructors
  where id NOT in (select instructor_id from audits);

--------------------------------------------

need to add to this for motivation:
Giving them morale boosts will spike their engagement and motivation.

I need to make sure that all of the feedback given will change the behavior to what I want

--------------------------------------------

improve audits so that peter thorpe's 7.1 (7.2) is a 4 or less

--------------------------------------------

variable compensation automation

--------------------------------------------

instructor interviews 

  house the teachback form - grading form (revamp with Jed)

  aggregate score - linkedin url, github, hr interview notes, summary teachback notes
  - resume upload
  - target score

  - button that says present to university -> sends it to university people that would receive the email - and the key internal people - shadee, greg, rd, jed

  url that expires after sometime or something

  for the main page - make it look nice and pretty

  teachback recording

  instructor approved, denied

-----
export to csv feature on each page
-----
leaderboard for student metrics - need at least 10

-----

point a lead in each university

and they have to work together at a university level

and they get a 500 dollar prize at each university to encourage them to win

or it's bragging rights - and create some healthy competition

why would I want to leave a community.
-----

instructors can login and see their audits to 

-----

national average per lesson
national average per 
--------------------------------------

--------------------------------------

bi-weekly highlights for RDs:
  latest audits per instructor per university that pertains to them

  and a paragraph from me

  instructors that have not uploaded any videos despite the notifications from us to them and SS

  improvements per instructor 

bi-weekly highlights for SS:
  latest audits per instructor for their university and how they compare amongst everyone else

  improvements per instructor 


raw format column headings =>
  Class Code GOOD
  Which week are you providing feedback on? GOOD
  What is your full name? GOOD
  How was class this week? GOOD
  How would you rate the pace of class this week? GOOD
  Do you feel that you have enough Academic Support? GOOD
  How much new learning did you achieve this week? GOOD
  How well do you feel you have mastered the concepts covered in class this week? GOOD
  How engaging was your instructor in his/her instruction? GOOD
  How clear was your instructor in his/her instruction? GOOD
  How knowledgeable did your instructor seem in the subject area? GOOD
  How Many hours did you spend outside of class last week on homework, code review, etc? GOOD
  What did you spend most of that time on? GOOD
  Any additional comments about the pace of the class? GOOD
  Any additional comments about the Academic Support? GOOD
  Any additional comments about your instructor? GOOD
  Any additional notes? GOOD

  rails generate scaffold StudentFeedback class_code:string week:integer student_name:string how_class_week:integer pace:integer acad_supp:integer new_learn:integer mastery:integer inst_engag:integer inst_clarity:integer inst_know:integer hours_outside:string spend_time_on:text pace_notes:text support_notes:text inst_notes:text add_notes:text  --no-stylesheets --no-mailer --no-javascripts --no-helper --no-controller-specs --no-view-specs

---------------------

---------------------
sign up to mailgun or something else
---------------------
add this text: before you do the audit - check if the audio works throughout the video! And make sure the video doesn't cut off in the middle

---------------------
clarity ->

how to prep for class?
  - take from killer instructor list

clarity:
      ---->
        when answering questions on what would x and y do if you do z if you're wrong -> do this -> let's try to

        -> make a joke about it ->
---------------------

tiering query to automate who to audit next

  which instructor do we audit next?

  - instructor that is tier 1 and are due an audit because (it's 2 weeks from their last audit date) OR (they have no audits)
  - instructors that are tier 2 that are new
  - instructors that are tier 1 that have not improved from their previous audit
  - lowest performing tier 3 instructors

  show priority of instructors to audit based on tiers on the instructor page

---------------------
class codes should be its own page - instructors can have multiple class codes (teaching two classes at the sametime)
---------------------
Pavan+Dong: page where it shows where the videos are for for each instructor
---------------------
Panopto problems (own records)

---------------------
desktop real estate could have been better

---------------------
average the latest audit per instructor per university and rank who has the best metrics in each university

average the latest audit per instructor per region and rank who has the best metrics in each region

---------------------

make a page for this - and link to the page from the audit:
  panopto video link is not labeled
    -> show screenshot of what it should be

  show if you do it the wrong way what the students see

  show if you do it the weird right way what the students see

---------------------
move positive information to the top
---------------------
audio quality text and panopto text in report
---------------------

compare audits - report
- really good for tier 1 instructors
---------------------

put in audit dates next to instructors - onto a seperate page - because instructors is crowded
