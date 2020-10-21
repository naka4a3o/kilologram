class CalendarsController < ApplicationController
  before_action :move_to_index
  before_action :set_calendar, only: [:show, :edit, :update, :destroy]

  # GET /calendars
  # GET /calendars.json
  def index
    @calendars = current_user.calendars
  end

  # GET /calendars/1
  # GET /calendars/1.json
  def show
  end

  # GET /calendars/new
  def new
    @user = User.find(params[:user_id])
    @calendar = Calendar.new
  end

  # GET /calendars/1/edit
  def edit
  end

  # POST /calendars
  # POST /calendars.json
  def create
    
    @calendar = Calendar.new(calendar_params)
      if @calendar.valid?
         @calendar.save
         redirect_to user_calendars_path, method: :get
      else
         redirect_to new_user_calendar_path
      end
  end

  # PATCH/PUT /calendars/1
  # PATCH/PUT /calendars/1.json
  def update
    @calendar.update(calendar_parameter)
    if  @calendar.valid?
      redirect_to user_calendars_path, method: :get, notice: "編集しました"
    else
      render 'edit'
    end
  end

  # DELETE /calendars/1
  # DELETE /calendars/1.json
  def destroy
    @calendar.destroy
    respond_to do |format|
      format.html { redirect_to user_calendars_path, method: :get }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calendar
      @calendar = current_user.calendars.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def calendar_params
      params.permit(:title, :content, :start_time).merge(user_id: current_user.id)
    end
    def calendar_parameter
      params.require(:calendar).permit(:title, :content, :start_time).merge(user_id: current_user.id)
    end
    def move_to_index
      redirect_to root_path unless user_signed_in? && current_user.id 
    end
end
