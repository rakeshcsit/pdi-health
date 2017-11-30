module PatientsHelper

	def who_made_note_give_link obj
		if ["Rep", "Staff"].include? obj.class.name
			link_to(obj) do 
				obj.full_name
				# "<span itemprop=\"name\">Vitamin K</span>".html_safe
			end
		else # assume its a user (admin)
			obj.email
		end
	end
end