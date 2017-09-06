# to do

request test strips

use letter opener for email

make sure authenticated before using the site

make sure roles are enforced for everything and the logic is centralized and for views

upon login let user update their password and credentials like email

test making notes with staff and rep and see if patients page breaks

# finished:

## 9-5-17

make it so you can update doctors on patient form

show notes that patient has on patients page (date and who made it that links to the note)


## 8-16-17

time zones added into each user

plus time zones are editable from everywhere

made it so updating the patient/doctor/staff/rep updates the user (but it doesn't update the password of that user -> I gave a flash message to remind the admin of that)

redirects happen appropriately based on the role of the user

rails generate scaffold Note patient:references interaction_type:string training_meeting:boolean note:text wdate:date --no-stylesheets --no-mailer --no-javascripts --no-helper --no-controller-specs --no-view-specs

patient notes added in a polymorphic way. If the admin makes notes, then this is bad. I'll tell Mark to not do this.

## 8-14-17

added inrs feature in

added custom validation for inr input 

added in data tables

customized navigation based upon patient, doctor, etc

## 8-3-17

rails generate scaffold Staff user:references full_name:string email:string

rails generate scaffold Rep user:references full_name:string email:string phone_number:string

modified controller structure for reps and staffs

put in active record assocations to users

when create a rep, staff member, it creates the users with it

updated navigation

remodeled has many through association to not have the active boolean (too complex)

## 7-25-17

	* fixed form elements in doctor and patient 

	* when patient is saved, the user is saved and the patient takes on that user's id

	* patients controller is solid with auto user creation 

	* I added 123456 at the end of each password to avoid the situation where the password is under 6 characters

	* made it so the doctor and patient controllers use html/json responses instead of all html

	* did the auto create user record before creating the doctor

	* took an abnormal amount of time to get the states to populate properly in the edit form :(

	* put password directions on site for staff/field rep. I used a layout for this.

	* patient, doctor edit/update works fine

	* made this model: rails g model manegization patient_id:integer doctor_id:integer active:boolean
	
	* got rid of the joining table by doing this:

	drop_table :doctors_patients

	* then updated the active record associations in the doctor, patient and mangeization models

	* then updated the sql query in the doctors_controller because there is no longer a doctors_patients joining table

	* changed up the architecture with has many through instead of has and belongs to many
		* show patients that doctor is managing or managed in the past
		* show doctors that patient has or had

	* fixed query in doctors controller because it was letting you assign patients to a doctor that already have an active doctor! I basically deleted one word -> NOT

	* did this:
		* I need a way to make doctors not active for certain patients and active for others. It doesn't make sense to do this anywhere but the doctor edit form
			* this could be a bunch of checkboxes that comes up only on the edit form for a doctor that shows the patients that the doctor has access to 
				* checks mean active, no check means not active
				* no need to make another joining table, I can use the joining table that was made and use the active column to determine the value of the checkboxes

	* fixed this issue:
		* the drop down is there and it's populating but it's definitely not working.

		I made a new doctor and the doctor shouldn't be able to assign a patient that is active for another doctor - but we can do it.

	* to do
		* I'm allowed to update a checkbox of an inactive patient that is active somewhere else
			* I should not be able to do that!

			http://localhost:3000/doctors/2/edit
				Clark is checked

			http://localhost:3000/doctors/1/edit
				Clark is not checked, but I should not be able to do this until Clark is unchecked on http://localhost:3000/doctors/2/edit

				I should link the user to http://localhost:3000/doctors/2/edit and tell them uncheck it there first
				
		* need to make sure checkboxes submit properly 
		* need to make sure things don't get erased by an update

		* I feel weird about the brainstorm
			* I also have to make sure the update works with the checkboxes

			* on update will I erase all the patients assigned to a doctor because I took them out of the multi select?
				*  I could have different dropdowns for new doctors and for editing doctors 
					* this way I can maintain the old sql query for the new doctors and create a new one like described below:

			* on edit, an inactive patient will show up in the dropdown. Is this ok? ']
				* If not, I could get all the patients that the doctor has never dealt with. That should fix it

		* time zone for doctor, patient

		* patient delete should redirect to patients and delete the user account	
			* but it should not delete if the patient is working with a doctor
				* it should notify the user trying to do so

		* doctor delete should delete 
			* but it should not delete if the doctor is working with an active patient
				* it should notify the user trying to do so

		* doctor and patient should be able to login and update their previous credentials

## 7-24-17

	* I think I finished set_patients in doctors_controller

	I installed a union gem but didn't use it. I did some sql, returned ids and then used the ids to do an active record subquery

	to get the union to work I had to make sure the columns were both the same between the two queries

	* got select2 to work on two dropdowns in doctor form

	* used a state helper for state

	* got rid of the user field 

	* added validation to the doctor model

	* auto create user when doctor or patient is created

## 7-19-17

	* scaffolded patient and doctor

	```
	# Patient scaffold:
	rails generate scaffold Patient user:references first_name:string middle_initial:string last_name:string email:string qualified:boolean communication_preferred:string insurance_verification:boolean prescription_acquired:boolean phone_number:string address:string state:string zipcode:string

	# Doctor scaffold:
	rails generate scaffold Doctor user:references full_name:string email:string phone_number:string fax_number:string address:string state:string zipcode:string hours:text
	```

	* added patient_notes to architecture on whiteboard

	* updated the user class with roles and the new default role

	* created joining table between doctors and patients, and added an active column

	my reasoning for this is that a patient could get a new doctor, and in that case, we need to maintain the patient's previous doctor and new doctor. Also, we need a way for the previous doctor to not have access to the patient's data anymore

	```
	    rails g migration CreateJoinTableDoctorsPatients doctors patients

	    # mapping table
	    create_join_table :doctors, :patients do |t|
	      t.index [:doctor_id, :patient_id]
	      t.index [:patient_id, :doctor_id]
	      t.boolean :active , :default => true, :null => false
	    end
	```

	* for a moment I was thinking we don't need two different models for a staff member and a field rep, because I could use the role to differentiate the two entities, however a field rep has many patients while a staff member does not

	the thing is it's weird to just have a model for this one reason so I'm going to leverage some relationship kung fu like this (but not like this)

	```
	has_many :received_reputation_changes, class_name: 'DiscussReputationChange', foreign_key: 'receiver_id', inverse_of: :receiver
	has_many :committed_reputation_changes, class_name: 'DiscussReputationChange', foreign_key: 'committer_id', inverse_of: :committer

	has_many :received_notifications, class_name: 'Notification', foreign_key: 'receiver_id', inverse_of: :receiver
	has_many :committed_notifications, class_name: 'Notification', foreign_key: 'committer_id', inverse_of: :committ
	```

	* I made it so when you create a doctor, you also select the patients (but only select patients that don't already have an active doctor)
		* almost done with this 

	* brain storm 
		* I need a way to make doctors not active for certain patients and active for others. It doesn't make sense to do this anywhere but the doctor edit form
			* this could be a bunch of checkboxes that comes up only on the edit form for a doctor that shows the patients that the doctor has access to 
				* checks mean active, no check means not active
				* no need to make another joining table, I can use the joining table that was made and use the active column to determine the value of the checkboxes

	* next steps:
		* finish: set_patients in doctors_controller
		* finish implementing above brain storm so you can turn off access to patients on a doctor's edit form

------------------------------
users need time zones - everyone needs one (I can assume admin is EST)

patients can login 
	log inr
	see their past inrs
	see how they can be compliant

	see chart of past inrs

field reps can login

admin can login
	add users in and administrate them

user_logins
	tracks when people login
patient screen

	first_name, last_name, email, last_contacted_date, date_of_initial_contact, qualified, communication_preferred, date_of_initial_call_to_doctor, date_of_script_being_approved, date_of_shipped_device, date_of_field_rep_assigned, field_rep, training_date, first_reported_inr, doctor, # of reports submitted towards compliance this month

	address, phone number, care taker information 

	date of being ready to be trained

	date + time of training

	Doctor scaffold:
	rails generate scaffold Doctor user:references first_name, last_name, email, last_contacted_date, date_of_initial_contact, qualified, communication_preferred, date_of_initial_call_to_doctor, date_of_script_being_approved, date_of_shipped_device, date_of_field_rep_assigned, field_rep, training_date, first_reported_inr

	medication:boolean food:boolean beverages:boolean appointments:boolean inrs:boolean wellness:boolean inactivity:boolean exercise:boolean weight:boolean compression:boolean menstruation:boolean --no-stylesheets --no-mailer --no-javascripts --no-helper --no-controller-specs --no-view-specs

patients

patient_documents
	type, patient_id, link

doctors

field_reps
	
field_reps_patients
	field_rep_id, patient_id

patient_communications
	patient_id, date, note, type, training (default false)

email_sents
	type, user_id

inrs
	patient_id, inr, date

test_strip_requests
	patient_id, date


add to the to do list:
--------------------
report on how long from patient info put in 
	to training 
	to first inr reported


stuff on white board
--------------------

TRUE:
	Patient testing:
	week 1: mon
	week 2: tue
	week 3: tue  (has to be on tue)

	Mark said this is ok:
	
	patient does test mon but reports monday's test on tuesday and is still compliant

PROJECT GUIDELINES:
	$100/hr (50 - 150 hrs)

	does not include costs of IVR, send grid costs, ssl costs, hosting costs, cloud66 costs, SEO

	$35/referral after 1 month of testing


