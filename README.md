target for analysts is 12 audits per week (3 per day)

uncheck instructors that are inactive - that we should not audit based on any number of reasons --> track this
-> so add active for instructors in migration and go through all the instructors and set them to true in the migration


automatically update an instructor's tier based on overall score of instructor.


instructors login to leopard to see all their audits, student metrics, interviews that students have went through
ratings that students gave - etc.


we should fields for the students to grade TAs

- let both SSMs and Rds update instructor information for their universities

- put pre quiz into leopard -> put the date

- you can see which instructors/tas that have not completed the quiz prior to the dry run

- bring in student data here and show the student data with the instructor data

which instructor do we audit next?

- instructor that is tier 1 and are due an audit because (it's 2 weeks from their last audit date) OR (they have no audits)
- instructors that are tier 2 that are new
- instructors that are tier 1 that have not improved from their previous audit
- lowest performing tier 3 instructors

ahmed -> capturing hw rates
show hw grade distribution
show hw feedback rate


allow to mark instructor - not active to not come up in above query


panopto video link is not labeled
  -> show screenshot of what it should be



add this text: before you do the audit - check if the audio works throughout the video! And make sure the video doesn't cut off in the middle

put in rules
for who becomes tier 1
on the instructor page and the tier updates page


average the latest audit per instructor per university and rank who has the best metrics in each university

average the latest audit per instructor per region and rank who has the best metrics in each region



sample plan we have for uncc
      Action Items:
      1. Communicate Student Thoughts to Terra
      2. Go over Pavan's Analysis with Terra
      3. Encourage her to really create a connection with students + encourage students to really ask a question. Let her know that she can break from script a bit to loosen it up.
      4. Encourage Tutoring with Greg
      5. Have Terra / Kevin attend each other's classes once.  
      6. Academic Team to Watch Feedback on Terra's class closely
      7. Get second screen for Terra
      8. Show output of code as he goes well (screen management)
      9. Steven to boost feedback

how to prep for class?
  - take from killer instructor list

do you have a second screen
- top instructors use a second monitor or a second laptop so they can

- "do the activity and make sure the other person got it"

clarity:
      ---->
        when answering questions on what would x and y do if you do z if you're wrong -> do this -> let's try to

        -> make a joke about it ->
-----
desktop real estate could have been better
-----

------
Sean’s his co-instructor

[10:58]  
we need to put those relationships into the app (edited)

[10:59]  
so if we see that an instructor is weak but the co is strong

[10:59]  
we can get the strong to help
---

target # dashboard

positive word dashboard

audio quality text and panopto text

move positive information to the top

Have the TAs in the system and send them

class codes should be its own page - instructors can have multiple class codes (teaching two classes at the sametime)

Panopto problems (own records)

Pavan+Dong: page where it shows where the videos are for for each instructor

Dan: on audit show - change the labels and values to not be double negatives

create api keys and documentation for the api

remove big flag from audit show and throw it at the top of the report

create filtering so you can take out certain parts of the audit on the show page to email out to someone.

PUT IN A FLAG to not show it to the instructor
  flag instructors that should not receive feedback - email will still go out but won't include the instructor's name

  - a note on the emails will be put there -

show nation average for the lesson plan if we have it and overall

show priority of instructors to audit based on tiers on the instructor page

encouragement flag - instructor that needs lots of positive encouragement

1. put in tiers for instructors_url
3. put in audit dates next to instructors - onto a seperate page - because instructors is crowded
6. tier updates need to be visible when editing an instructor
7. compare audits - report
- really good for tier 1 instructors

8. bulk reporting for rds and ss

list of dates and audits per date

never do saturday classes (not always 1.3,2.3) never do 1.1
---------

rails generate scaffold Blah user:references medication:boolean food:boolean beverages:boolean appointments:boolean inrs:boolean wellness:boolean inactivity:boolean exercise:boolean weight:boolean compression:boolean menstruation:boolean --no-stylesheets --no-mailer --no-javascripts --no-helper --no-controller-specs --no-view-specs

rails generate scaffold Tier tier:integer notes:text --no-stylesheets --no-mailer --no-javascripts --no-helper --no-controller-specs --no-view-specs

rails generate scaffold University university:string --no-stylesheets --no-mailer --no-javascripts --no-helper --no-controller-specs --no-view-specs

rails generate scaffold Analyst name:string email:string --no-stylesheets --no-mailer --no-javascripts --no-helper --no-controller-specs --no-view-specs

rails generate scaffold Rd rd:string rd_email:string --no-stylesheets --no-mailer --no-javascripts --no-helper --no-controller-specs --no-view-specs

rails generate scaffold StudentSuccessManager university:references ss:string ss_email:string --no-stylesheets --no-mailer --no-javascripts --no-helper --no-controller-specs --no-view-specs

rails generate scaffold Instructor university:references instructor:string email:string phone:string class_code:string hired_date:date start_date:date dry_run_date:date pre_quiz_taken:boolean --no-stylesheets --no-mailer --no-javascripts --no-helper --no-controller-specs --no-view-specs

rails generate scaffold LessonPlan lp:decimal lp_link:text  --no-stylesheets --no-mailer --no-javascripts --no-helper --no-controller-specs --no-view-specs

rails generate scaffold Post title:string author:string body:text  --no-stylesheets --no-mailer --no-javascripts --no-helper --no-controller-specs --no-view-specs

rails generate scaffold Audit instructor:references lesson_plan:references big_flag:boolean video_url:text fame:boolean fame_notes:text objs:boolean action_flag:boolean vocal_enc_num:integer discuss_num:integer mov_aw_noi_num:integer mean_quest_num:integer directed_quest_num:integer tangent_num:integer tangent_notes:text fifteen_noeng:boolean anti_jargon_num:integer anti_jargon_notes:text nervous:boolean engage_num:integer engage_notes:text percent_lp:string percent_hp_lp:integer overall_num:integer overall_factors:text audio_qual_num:integer code_is_no_big:boolean notes:text --no-stylesheets --no-mailer --no-javascripts --no-helper --no-controller-specs --no-view-specs
