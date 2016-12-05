class InstructorsController < ApplicationController
  before_action :set_instructor, only: [:show, :edit, :update, :destroy]
  before_action :set_universities, only: [:new, :edit, :create]
  before_action :set_tiers, only: [:new, :edit, :create]
  before_filter :authenticate_user!
  before_action :check_if_admin, only: [:new, :edit, :create, :update, :destroy]

  # GET /instructors
  # GET /instructors.json
  def index

    # this gets me a list of instructors that are tier 1 and their latest audit overall score ordered from the worst performing to the highest performing
    # NOTE TO SELF I will need to do a where ins.active = true; to get rid of jeff pinkston, david wittaker
      # select a.instructor_id, max(a.overall_num)
      # from audits a
      # left join instructors ins
      # on ins.id = a.instructor_id
      # left join tiers t
      # on t.id = ins.tier_id
      # where t.tier = 1
      # group by a.instructor_id
      # order by max(a.overall_num) ASC;
      #
      # select AVG(overall_num)
      # from audits;

    # - instructor that is tier 1 and are due an audit because (it's 2 weeks from their last audit date) OR (they have no audits)
      # select (current_date - a.audit_date) as range
      # from audits a
      # left join instructors i
      # on a.instructor_id = i.id
      # left join tiers t
      # on i.tier_id = t.id
      # where t.tier = 1
      # AND (current_date - a.audit_date) >= 14;

    # - instructors that are tier 1 that have not improved from their previous audit
      # select *
      # from audits a
      # left join instructors ins
      # on a.instructor_id = ins.id
      # left join tiers t
      # on ins.tier_id = t.id
      # where t.tier = 1
      # order by a.overall_num;

    # finds all the instructors that are tier 1
    # select *
    # from instructors ins
    # left join tiers t
    # on ins.tier_id = t.id
    # where t.tier = 1;

    # - instructors that are tier 2 that are new
    # select *
    # from instructors ins
    # left join tiers t
    # on ins.tier_id = t.id
    # where t.tier = 2;

    # - lowest performing to highest performing tier 3 instructors
    # select *
    # from audits a
    # left join instructors ins
    # on a.instructor_id = ins.id
    # left join tiers t
    # on ins.tier_id = t.id
    # where t.tier = 3
    # order by a.overall_num;

    @instructors = Instructor.includes(:audits)

  end

  # GET /instructors/1
  # GET /instructors/1.json
  def show
  end

  # GET /instructors/new
  def new
    @instructor = Instructor.new
  end

  # GET /instructors/1/edit
  def edit
  end

  # POST /instructors
  # POST /instructors.json
  def create
    @instructor = Instructor.new(instructor_params)

    respond_to do |format|
      if @instructor.save
        format.html { redirect_to @instructor, notice: 'Instructor was successfully created.' }
        format.json { render :show, status: :created, location: @instructor }
      else
        format.html { render :new }
        format.json { render json: @instructor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instructors/1
  # PATCH/PUT /instructors/1.json
  def update
    respond_to do |format|

      previous_tier = @instructor.tier_id

      if @instructor.update(instructor_params)

        unless previous_tier == @instructor.tier_id

          if ((params['instructor']['tier_update_notes']) and (params['instructor']['tier_update_notes'] != ""))
            TierUpdate.create({instructor_id: @instructor.id, old_tier: previous_tier, new_tier: @instructor.tier_id, notes: params['instructor']['tier_update_notes']})
          else
            format.html { redirect_to edit_instructor_path(@instructor), alert: 'You can not change the tier of an instructor without giving a reason!' }
          end
        end

        format.html { redirect_to @instructor, notice: 'Instructor was successfully updated.' }
        format.json { render :show, status: :ok, location: @instructor }
      else
        format.html { render :edit }
        format.json { render json: @instructor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instructors/1
  # DELETE /instructors/1.json
  def destroy
    @instructor.destroy
    respond_to do |format|
      format.html { redirect_to instructors_url, notice: 'Instructor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_tiers
      @tiers = Tier.all
    end

    def set_universities
      @universities = University.all
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_instructor
      @instructor = Instructor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instructor_params
      params.require(:instructor).permit(:university_id, :instructor, :email, :phone, :class_code, :hired_date, :start_date, :dry_run_date, :pre_quiz_taken, :tier_id, :active)
    end
end
