class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :set_patients, only: [:new, :edit, :create, :update]

  respond_to :html

  def index
    @notes = Note.all
    respond_with(@notes)
  end

  def show
    respond_with(@note)
  end

  def new
    @note = Note.new

    if params[:id]
      @note.patient_id = params[:id]
    end

    respond_with(@note)
  end

  def edit
  end

  def create
    @note = Note.new(note_params)

    # taking advantage of polymorphism in rails
    if current_user.role == 'field_rep'
      noteable_type = current_user.rep
      @note.noteable_id = noteable_type.id
      @note.noteable_type = noteable_type.class.name
    elsif current_user.role == 'staff'  
      noteable_type = current_user.staff
      @note.noteable_id = noteable_type.id
      @note.noteable_type = noteable_type.class.name
    else
      # in case the admin or someone else makes a note (probably should never happen but if it does then during debugging I could find out why from the database)
      @note.noteable_type = "User"
      @note.noteable_id = current_user.id
    end
    
    @note.save
    respond_with(@note)
  end

  def update
    @note.update(note_params)
    respond_with(@note)
  end

  def destroy
    @note.destroy
    respond_with(@note)
  end

  private
    def set_patients
      patients = Patient.all

      @patients = patients.map{|p| ["id: #{p.id} name: #{p.first_name} #{p.middle_initial} #{p.last_name}", p.id] }
    end

    def set_note
      @note = Note.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:patient_id, :interaction_type, :training_meeting, :note, :wdate)
    end
end
