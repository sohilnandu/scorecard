class ScorecardsController < ApplicationController
  include JSON
  before_action :set_scorecard, only: [:show, :edit, :update, :destroy]

  # GET /scorecards
  # GET /scorecards.json
  def index
    @scorecards = Scorecard.all
  end

  # GET /scorecards/1
  # GET /scorecards/1.json
  def show
    json_data = JSON.parse(@scorecard.data)
    @total_records = json_data['totalRecords']
    @vertical = json_data['vertical']
    @wrong_address_count = json_data['wrongAddressCount']
    @invalid_address_count = json_data['invalidAddressCount']
    @deceased_count = json_data['deceasedCount']
    @do_not_mail_count = json_data['doNotMailCount']
    @missing_birthday_count = json_data['missingBirthdayCount']
    @missing_email_count = json_data['missingEmailCount']
    @missing_phone_number_count = json_data['missingPhoneNumberCount']
    @missing_gender_count = json_data['missingGenderCount']
  end

  # GET /scorecards/new
  def new
    @scorecard = Scorecard.new
  end

  # GET /scorecards/1/edit
  def edit
  end

  # POST /scorecards
  # POST /scorecards.json
  def create
    @scorecard = Scorecard.new(scorecard_params)

    respond_to do |format|
      if @scorecard.save
        format.html { redirect_to @scorecard, notice: 'Scorecard was successfully created.' }
        format.json { render action: 'show', status: :created, location: @scorecard }
      else
        format.html { render action: 'new' }
        format.json { render json: @scorecard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scorecards/1
  # PATCH/PUT /scorecards/1.json
  def update
    respond_to do |format|
      if @scorecard.update(scorecard_params)
        format.html { redirect_to @scorecard, notice: 'Scorecard was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @scorecard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scorecards/1
  # DELETE /scorecards/1.json
  def destroy
    @scorecard.destroy
    respond_to do |format|
      format.html { redirect_to scorecards_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scorecard
      @scorecard = Scorecard.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scorecard_params
      params.require(:scorecard).permit(:site_id, :org_name, :data)
    end


end
