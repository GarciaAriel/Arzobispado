class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]

  # GET /surveys
  # GET /surveys.json
  
  def index 
    @submenu=1
    @surveys = Survey.where(:evento_id=>params[:id])
    @evento_id=params[:id]
    @evento=Evento.find(@evento_id)
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
    @submenu=1
    @evento = Evento.find(@survey.evento_id)
    @survey = Survey.find(@survey.id)
  end

  # GET /surveys/new
  def new
    @submenu=1
    if(current_user!=nil && current_user.rol=='admin')
      @evento=Evento.find(params[:id])
      @survey = Survey.new
      # 2.times do
      #   question = @survey.questions.build
      #   3.times { question.answers.build }
      # end
      
    else
      redirect_to root_path
    end
    
  end

  # GET /surveys/1/edit
  def edit
    @evento = Evento.find(@survey.evento_id)
    @submenu=1
  end

  # POST /surveys
  # POST /surveys.json
  def create
    @submenu=1
    @survey = Survey.new(survey_params)

    respond_to do |format|
      if @survey.save
        format.html { redirect_to @survey, notice: 'Survey was successfully created.' }
        format.json { render :show, status: :created, location: @survey }
      else
        format.html { render :new }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surveys/1
  # PATCH/PUT /surveys/1.json
  def update
    @submenu=1
    respond_to do |format|

      # member.avatar.marked_for_destruction? # => true
      # member.save

      if @survey.update(survey_params)
        format.html { redirect_to @survey, notice: 'Survey was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey }
      else
        format.html { render :edit }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @submenu=1
    @survey.destroy
    respond_to do |format|
      #surveys_index_path(@evento.id)
      #format.html { redirect_to surveys_url, notice: 'Survey was successfully destroyed.' }
      format.html { redirect_to surveys_index_path(@survey.evento_id), notice: 'Survey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_params
      params.require(:survey).permit(:name,:evento_id,:docu,questions_attributes: [
       :content, :id, :survey_id,:_destroy, 
       answers_attributes: [:content, :id, :questions_id,:_destroy]
     ])

    #   questions_attributes: [
    #   :content, :id, :survey_id, 
    #   answers_attributes: [:content, :id, :questions_id]
    # ]
    end
end
