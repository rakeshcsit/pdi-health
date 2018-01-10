class CreateAudits < ActiveRecord::Migration[5.0]
  def change
    create_table :audits do |t|
      t.references :instructor, index: true
      t.references :lesson_plan, index: true
      t.boolean :big_flag, default: false
      t.text :video_url
      t.boolean :fame, default: false
      t.text :fame_notes
      t.boolean :objs, default: false
      t.boolean :action_flag, default: false
      t.integer :vocal_enc_num
      t.integer :discuss_num
      t.integer :mov_aw_noi_num
      t.integer :mean_quest_num
      t.integer :directed_quest_num
      t.integer :tangent_num
      t.text :tangent_notes
      t.boolean :fifteen_noeng, default: false
      t.integer :anti_jargon_num
      t.text :anti_jargon_notes
      t.boolean :nervous, default: false
      t.integer :engage_num
      t.text :engage_notes
      t.string :percent_lp
      t.integer :percent_hp_lp
      t.integer :overall_num
      t.text :overall_factors
      t.integer :audio_qual_num
      t.boolean :code_is_no_big, default: false
      t.text :notes

      t.timestamps
    end
  end
end
