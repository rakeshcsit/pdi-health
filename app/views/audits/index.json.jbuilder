json.array!(@audits) do |audit|
  json.extract! audit, :id, :instructor_id, :lesson_plan_id, :big_flag, :video_url, :fame, :fame_notes, :objs, :action_flag, :vocal_enc_num, :discuss_num, :mov_aw_noi_num, :mean_quest_num, :directed_quest_num, :tangent_num, :tangent_notes, :fifteen_noeng, :anti_jargon_num, :anti_jargon_notes, :nervous, :engage_num, :engage_notes, :percent_lp, :percent_hp_lp, :overall_num, :overall_factors, :audio_qual_num, :code_is_no_big, :notes
  json.url audit_url(audit, format: :json)
end
