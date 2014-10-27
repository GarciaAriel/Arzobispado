class LogsController < ApplicationController
  before_action :set_log, only: [:show, :edit, :update, :destroy]

  # GET /logs
  # GET /logs.json
  def index
    if params[:log_date].blank?
      @logs = Log.all.page(params[:page]).per(10)
    else
      @logs = Log.where("DATE(created_at) = ?", params[:log_date].to_date).page(params[:page]).per(5)
    end
 #  SendMail.testeando.deliver
  end
def save

   if params[:log_date].blank?
      @logs = Log.all
      
    else
      @logs = Log.where("DATE(created_at) = ?", params[:log_date].to_date)

    end
savefile(@logs)


end
  # GET /logs/1
  # GET /logs/1.json
  def show
  end

  # GET /logs/new
  def new
    @log = Log.new
  end

  # GET /logs/1/edit
  def edit
  end

  # POST /logs
  # POST /logs.json
  def create
    @log = Log.new(log_params)

    respond_to do |format|
      if @log.save
        format.html { redirect_to @log, notice: 'Log was successfully created.' }
        format.json { render :show, status: :created, location: @log }
      else
        format.html { render :new }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /logs/1
  # PATCH/PUT /logs/1.json
  def update
    respond_to do |format|
      if @log.update(log_params)
        format.html { redirect_to @log, notice: 'Log was successfully updated.' }
        format.json { render :show, status: :ok, location: @log }
      else
        format.html { render :edit }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logs/1
  # DELETE /logs/1.json
  def destroy
    @log.destroy
    respond_to do |format|
      format.html { redirect_to logs_url, notice: 'Log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def savefile(logs)
    @bigtable = ""
    logs.each do |log|
      @bigtable<<log.description+"\n"
    end
    doc = "log.txt"
    File.open(doc, "w", :type => 'text/html; charset=utf-8'){ |f| f << @bigtable}
    send_file(doc, :disposition => 'attachment')
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_log
      @log = Log.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def log_params
      params.require(:log).permit(:description, :user_id)
    end
end
