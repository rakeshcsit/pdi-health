class AuditsController < ApplicationController
  before_action :set_audit, only: [:show, :edit, :update, :destroy]
  before_action :set_instructors, only: [:new, :edit, :create, :update]
  before_action :set_lps, only: [:new, :edit, :create, :update]
  before_filter :authenticate_user!
  before_action :check_if_admin, only: [:new, :edit, :create, :update, :destroy]

  # GET /audits
  # GET /audits.json
  def index
    @audits = Audit.order("created_at DESC")
  end

  # GET /audits/1
  # GET /audits/1.json
  def show
    u = @audit.instructor.university
    @s = u.student_success_manager
    @r = u.rd

    a = Audit.new
    retAt = a.retAt
    retEx = a.retEx

    @vocal_enc_num = retAt["vocal_enc_num"]
    @discuss_num = retAt["discuss_num"]
    @mov_aw_noi_num = retAt["mov_aw_noi_num"]
    @mean_quest_num = retAt["mean_quest_num"]
    @directed_quest_num = retAt["directed_quest_num"]
    @anti_jargon_num = retAt["anti_jargon_num"]
    @engage_num = retAt["engage_num"]
    @overall_num = retAt["overall_num"]
    @audio_qual_num = retAt["audio_qual_num"]
    @big_flag = retEx["big_flag"]
    @objs = retEx["objs"]
    @action_flag = retEx["action_flag"]
    @tangent_num = retEx["tangent_num"]
    @fifteen_noeng = retEx["fifteen_noeng"]
    @nervous = retEx["nervous"]
    @percent_hp_lp = retEx["percent_hp_lp"]
    @percent_lp = "80% to 100%"
    @code_is_no_big = retEx["code_is_no_big"]

    @previous_audit = Audit.where(["instructor_id = ? and id != ?", @audit.instructor_id, @audit.id]).order('audit_date DESC').limit(1).first

    # automate rules logic
    if @previous_audit
      if (@audit.overall_num <= @previous_audit.overall_num) and (@audit.overall_num < 6)
        @message_one = "
        <div class='notOptimal box'>

          <h2>Automated Red Flag</h2>

          <div>
            This instructor's overall score did not improve from the previous audit and is below a 6 for the overall score. This is a HUGE red flag that the instructor is not taking our feedback seriously. Or that the feedback isn't being given to the instructor in a serious manner.
          </div>
        </div>"

        @slack_addition = "<p>The instructor is not improving based on the comparison from the previous audit. #{@s.ss} how can we emphasize to #{@audit.instructor.instructor} that the numbers in this audit need to be improved? What do you suggest needs to happen? We can advise you if you'd like.</p>"
      end
    end

    absolute_url = request.base_url + request.original_fullpath
    send_slack_to = "
    <h3>Step One:</h3>
    <div class='indent'>
      <p><strong>Send a slack to:</strong></p>

      <table class='table-plain indent'>
        <thead>
          <th>Student Success Manager</th>
          <th>Regional Director</th>
          <th>Academic Analyst</th>
          <th>EVP of Operations</th>
          <th>Chief Learning Officer</th>
          <th>Director of Engagement</th>
          <th>VP of Academic Experience</th>

        <thead>
        <tbody>
          <tr>
            <td>#{@s.ss}</td>
            <td>#{@r.rd}</td>
            <td>Dong Son</td>
            <td>Greg Calverase</td>
            <td>Pavan Katepalli</td>
            <td>Jed Woodarek</td>
            <td>Ahmed Haque</td>
          </tr>
        </tbody>
      </table>
    </div>"

    copy_analysis =
    "<div class='indent'>
      <p>Copy the analysis below and send an email out with the specified recipients and subject located below.</p>
    </div>"


    if ((@audit.overall_num > 9) or (@audit.fame))
      @message_two = send_slack_to + "

      <h3>Step Two:</h3>

      <div class='indent'>
        <p><strong>The slack will read like this:</strong></p>

        <div class='indent'>
          <p>Hey #{@s.ss}, #{@audit.instructor.instructor} did INCREDIBLE! Here's the audit we did: #{absolute_url}.</p>

          <p>If you need the code to sign up to our analytics dashboard, it's: #{ENV["CODE_TO_SIGN_UP"]}</p>
        </div>
      </div>
      "
    elsif  ((6 <= @audit.overall_num) and  (@audit.overall_num <= 8))
      @message_two = "
      <h3>Step One:</h3>

      #{copy_analysis}
      "
    elsif @audit.overall_num == 5
      @message_two = send_slack_to + "

      <div class='indent'>
        <p><strong>The Slack will read like this:</strong></p>

        <div class='indent'>
          <p>Hey #{@s.ss} can you talk to #{@audit.instructor.instructor} as soon as possible regarding this audit: #{absolute_url}?</p>

          <p>#{@audit.instructor.instructor} scored a #{@audit.overall_num}/10, which is in our warning zone. To get out of the warning zone, #{@audit.instructor.instructor} has to score a 6 or above on the next audit. The key is for #{@audit.instructor.instructor} to increase the numbers that are red in the audit.</p>

          #{@slack_addition}

          <p>We'll conduct another audit by #{@audit.audit_date + 14} and really want the score to be better next time.</p>

          <p>If you need the code to sign up to our analytics dashboard, it's: #{ENV["CODE_TO_SIGN_UP"]}</p>
        </div>

      </div>

      <h3>Step Two:</h3>

      <div class='indent'>
        <p>Wait for a confirmation from #{@s.ss} on slack.</p>
      </div>

      <h3>Step Three:</h3>

      #{copy_analysis}"
    elsif @audit.overall_num < 5
      @message_two = send_slack_to + "

        <div class='indent'>
          <p>Hey #{@s.ss} can you go to #{@audit.instructor.instructor}'s class as soon as possible regarding this audit: #{absolute_url}?</p>

          <p>We'd like you to give #{@audit.instructor.instructor} the feedback from the audit in person. While watching #{@audit.instructor.instructor} during the first half of class, you could take note of the things that could improve in relation to the audit metrics and during break ask #{@audit.instructor.instructor} to do those things during the second half.</p>

          <p>#{@audit.instructor.instructor} scored a #{@audit.overall_num}/10, which is in our DANGER zone. To get out of the DANGER zone, #{@audit.instructor.instructor} has to either score a 5 to be in the warning zone, or score 6 or greater on the next audit. The key is for #{@audit.instructor.instructor} to increase the numbers that are red in the audit.</p>

          #{@slack_addition}

          <p>We'll conduct another audit by #{@audit.audit_date + 14} and really want the score to be better next time.</p>

          <p>If you need the code to sign up to our analytics dashboard, it's: #{ENV["CODE_TO_SIGN_UP"]}</p>
        </div>

      <h3>Step Two:</h3>

      <div class='indent'>
        <p>Wait for a confirmation from #{@s.ss} on slack.</p>
      </div>

      <h3>Step Three:</h3>

      #{copy_analysis}"
    end
  end

  # GET /audits/new
  def new
    @audit = Audit.new
  end

  # GET /audits/1/edit
  def edit
  end

  # POST /audits
  # POST /audits.json
  def create
    @audit = Audit.new(audit_params)

    respond_to do |format|
      if @audit.save

        update_tier(@audit)

        format.html { redirect_to @audit, notice: 'Audit was successfully created.' }
        format.json { render :show, status: :created, location: @audit }
      else
        format.html { render :new }
        format.json { render json: @audit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /audits/1
  # PATCH/PUT /audits/1.json
  def update
    respond_to do |format|

      if @audit.update(audit_params)

        update_tier(@audit)

        format.html { redirect_to @audit, notice: 'Audit was successfully updated.' }
        format.json { render :show, status: :ok, location: @audit }
      else
        format.html { render :edit }
        format.json { render json: @audit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /audits/1
  # DELETE /audits/1.json
  def destroy
    @audit.destroy
    respond_to do |format|
      format.html { redirect_to audits_url, notice: 'Audit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_instructors
      @instructors = Instructor.all
    end

    def set_lps
      @lesson_plans = LessonPlan.all
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_audit
      @audit = Audit.find(params[:id])
    end

    # if john's tier is 1 and current audit score is 5 then nothing happens
    # if john's tier is 3 and current audit score is 6 then nothing happens
    # if john's tier is 1 and current audit score is 6 then tier gets updated to 3 and TierUpdate gets made
    # if john's tier is 3 and current audit score is 5 then tier gets updated to 1 and TierUpdate gets made
    def update_tier a
      ins = a.instructor
      ptId = ins.tier_id

      if a.overall_num < 6
        t = Tier.where({:tier => 1}).first
        str = "scored less than 6 on audit"
      else
        # find tier 3
        t = Tier.where({:tier => 3}).first
        str = "scored 6 or above on audit"
      end

      # if tier 1's id does not equal to instructor's previous tier id then update instructor's tier to 1 and create a TierUpdate
      # if tier 3's id does not equal to instructor's previous tier id then update instructor's tier to 3 and create a TierUpdate
      if t.id != ptId
        ins.update({:tier_id => t.id})
        TierUpdate.create({:instructor_id => a.instructor.id, :old_tier => ptId, :new_tier => t.id, :notes => str})
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def audit_params
      params.require(:audit).permit(:instructor_id, :lesson_plan_id, :big_flag, :action_flag, :video_url, :fame, :fame_notes, :objs, :vocal_enc_num, :discuss_num, :mov_aw_noi_num, :mean_quest_num, :directed_quest_num, :tangent_num, :tangent_notes, :fifteen_noeng, :anti_jargon_num, :anti_jargon_notes, :nervous, :engage_num, :engage_notes, :percent_lp, :percent_hp_lp, :overall_num, :overall_factors, :audio_qual_num, :code_is_no_big, :notes, :audit_date, :sent_email)
    end
end
