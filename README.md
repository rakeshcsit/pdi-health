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

make sure audit params match audit form params

encouragement flag - instructor that needs lots of positive encouragement

1. put in tiers for instructors_url
3. put in audit dates next to instructors
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

rails generate scaffold Audit instructor:references lesson_plan:references big_flag:boolean video_url:text fame:boolean fame_notes:text objs:boolean action_flag:boolean vocal_enc_num:integer discuss_num:integer mov_aw_noi_num:integer mean_quest_num:integer directed_quest_num:integer tangent_num:integer tangent_notes:text fifteen_noeng:boolean anti_jargon_num:integer anti_jargon_notes:text nervous:boolean engage_num:integer engage_notes:text percent_lp:string percent_hp_lp:integer overall_num:integer overall_factors:text audio_qual_num:integer code_is_no_big:boolean notes:text --no-stylesheets --no-mailer --no-javascripts --no-helper --no-controller-specs --no-view-specs
