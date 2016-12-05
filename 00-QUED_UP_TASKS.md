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
