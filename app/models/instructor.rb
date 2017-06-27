class Instructor < ActiveRecord::Base
  belongs_to :university
  has_many :tier_updates
  has_many :audits
  belongs_to :tier

  validates :email, uniqueness: true


  def self.dsjf
  	connection.select_all %Q(
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
  	  )
  end


  # prioritize tier 2 before tier 1 and then tier 3
  # - tier 2 has no order - in the future order by experience of instructors in market and SS
  # but only focus on tier 1s that haven’t been given an analysis for more than 14 days
  # and only focus on tier 3s that haven’t been given an analysis for more than 30 days
  def self.prioritization_two
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
    )
  end

  def self.prioritization_one
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
      tier_one_ordered
    )
  end

  def self.prioritization_three
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
      tier_three_ordered
    )
  end

  def self.instructors_prioritized
    instructors_prioritized = Instructor.prioritization.rows.flatten

    # I can't do where id in (list or instructor ids here) because otherwise sql resorts the list

    #*"," turns an array into a string
    manipulated_ins_prioritized = "{" + instructors_prioritized*"," + "}"

    query = "SELECT i.*
  	FROM   instructors i
  	JOIN   unnest('" + manipulated_ins_prioritized + "'::int[]) WITH ORDINALITY t(id, ord) USING (id)
  	ORDER  BY t.ord;"

    connection.select_all(query)
  end
end
