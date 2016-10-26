class CreateStudentSuccessManagers < ActiveRecord::Migration
  def change
    drop_table :sses

    create_table :student_success_managers do |t|
      t.references :university, index: true
      t.string :ss
      t.string :ss_email
    
      t.timestamps
    end

    StudentSuccessManager.reset_column_information

		[{"id"=>1, "university_id"=>1, "ss"=>"Kalimah Perry", "ss_email"=>"kperry@trilogyed.com", "created_at"=>"2016-10-22T05:49:13.399Z", "updated_at"=>"2016-10-22T05:49:13.399Z"}, {"id"=>2, "university_id"=>2, "ss"=>"Adrienne O'Leary", "ss_email"=>"adrienne@trilogyed.com", "created_at"=>"2016-10-22T05:49:13.405Z", "updated_at"=>"2016-10-22T05:49:13.405Z"}, {"id"=>3, "university_id"=>3, "ss"=>"Ilyssa Rosenzweig", "ss_email"=>"irosenzweig@trilogyed.com", "created_at"=>"2016-10-22T05:49:13.410Z", "updated_at"=>"2016-10-22T05:49:13.410Z"}, {"id"=>4, "university_id"=>4, "ss"=>"Steve CaChat", "ss_email"=>"scachat@trilogyed.com", "created_at"=>"2016-10-22T05:49:13.416Z", "updated_at"=>"2016-10-22T05:49:13.416Z"}, {"id"=>5, "university_id"=>5, "ss"=>"Brett Payne", "ss_email"=>"brett@trilogyed.com", "created_at"=>"2016-10-22T05:49:13.421Z", "updated_at"=>"2016-10-22T05:49:13.421Z"}, {"id"=>6, "university_id"=>6, "ss"=>"Caleb Andersh", "ss_email"=>"candersh@trilogyed.com", "created_at"=>"2016-10-22T05:49:13.425Z", "updated_at"=>"2016-10-22T05:49:13.425Z"}, {"id"=>7, "university_id"=>7, "ss"=>"Ricky Cuellar", "ss_email"=>"rcuellar@trilogyed.com", "created_at"=>"2016-10-22T05:49:13.430Z", "updated_at"=>"2016-10-22T05:49:13.430Z"}, {"id"=>8, "university_id"=>8, "ss"=>"Alex Garett", "ss_email"=>"agarett@trilogyed.com", "created_at"=>"2016-10-22T05:49:13.435Z", "updated_at"=>"2016-10-22T05:49:13.435Z"}].each do |pp|
			StudentSuccessManager.create({:university_id => pp["id"], :ss => pp["ss"], :ss_email => pp["ss_email"] })
		end
  end
end
