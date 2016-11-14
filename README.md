put in rules
for who becomes tier 1

for when to ping rds and ss on slack

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

instructor form needs a part about why the tier is getting updated

------

so for the instructors that get below a 6, you don't want me to send it to the instructor but to the RD, SSD, you, Jed and Ahmed?

Pavan Katepalli	[10:21 AM]  
ah

Pavan Katepalli	[10:40 AM]  
yeah message the RD, SSD, me, Ahmed

[10:40]  
link to the audit

[10:40]  
and let them know why it was a flag

[10:41]  
if it’s a 5

[10:41]  
send it out

[10:41]  
if it’s below that

[10:41]  
wait for a response from RD/SS on a plan for them to come in

[10:41]  
and then you shoot it out

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
