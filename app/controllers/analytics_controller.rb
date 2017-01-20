class AnalyticsController < ApplicationController

end
# WITH latest_instructors_audits_optimized AS (
#     SELECT au.*, 
#     (CASE
#       WHEN (au.percent_hp_lp = '< 40%') THEN 40
#       WHEN (au.percent_hp_lp = '40% to 60%') THEN 50
#       WHEN (au.percent_hp_lp = '60% to 80%') THEN 70
#       WHEN (au.percent_hp_lp = '80% to 100%') THEN 90
#       WHEN (au.percent_hp_lp = '100%') THEN 100
#       WHEN (au.percent_hp_lp IS NULL) THEN 0
#       ELSE 0
#     END) AS hp_lp,
#     (CASE
#       WHEN (au.percent_lp = '< 40%') THEN 40
#       WHEN (au.percent_lp = '40% to 60%') THEN 50
#       WHEN (au.percent_lp = '60% to 80%') THEN 70
#       WHEN (au.percent_lp = '80% to 100%') THEN 90
#       WHEN (au.percent_lp = '100%') THEN 100
#       WHEN (au.percent_lp IS NULL) THEN 0
#       ELSE 0
#     END) AS lp
#     FROM audits au
#     WHERE id IN (SELECT au.id
#     FROM audits au LEFT JOIN audits au2
#      ON (au.instructor_id = au2.instructor_id AND au.id < au2.id)
#     WHERE au2.id IS NULL)
#   )
#   select AVG(engage_num) as engage_avg, AVG(vocal_enc_num) as vocal_enc_avg, AVG(mean_quest_num) as mean_quest_avg, AVG(discuss_num) as discuss_avg, AVG(overall_num) as overall_avg, AVG(lp) as lp_avg, AVG(hp_lp) as hp_lp_avg from latest_instructors_audits_optimized;