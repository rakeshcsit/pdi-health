class Instructor < ActiveRecord::Base
  belongs_to :university
  has_many :tier_updates
  has_many :audits
  belongs_to :tier

  validates :email, uniqueness: true

  def self.prioritization

  	connection.select_all %Q(
	  	WITH tier_two_ordered AS (
	  	select i.id 
	  	from instructors i
	  	left join tiers t
	  	on i.tier_id = t.id
	  	where t.tier = 2 AND i.active = true)
  	,
  	tier_one_ordered AS (
	  	select i.id
	  	from instructors i
	  	left join tiers t
	  	on i.tier_id = t.id
	  	left join audits a
	  	on a.instructor_id = i.id
	  	where t.tier = 1 
	  	and i.active = true
	  	group by i.instructor, i.id
	  	having (current_date - MAX(a.audit_date)) > 14
	  	order by MAX(a.audit_date)
  	)
  	,
  	tier_three_ordered AS (
	  	select i.id
	  	from instructors i
	  	left join tiers t
	  	on i.tier_id = t.id
	  	left join audits a
	  	on a.instructor_id = i.id
	  	where t.tier = 3 
	  	and i.active = true
	  	group by i.instructor, i.id
	  	having (current_date - MAX(a.audit_date)) > 30
	  	order by MAX(a.audit_date)
  	)
	  	select * from 
	  	tier_two_ordered
  	UNION
	  	select * from 
	  	tier_one_ordered
  	UNION 
	  	select * from 
	  	tier_three_ordered
  	)

  end
end
