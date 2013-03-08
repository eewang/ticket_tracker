class SportsController < ApplicationController
  # GET /sports
  # GET /sports.json
  def index
    @sports = Sport.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sports }
    end
  end

  # GET /sports/1
  # GET /sports/1.json
  def show
    @sport = Sport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sport }
    end
  end

  # GET /sports/new
  # GET /sports/new.json
  def new
    @sport = Sport.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sport }
    end
  end

  # GET /sports/1/edit
  def edit
    @sport = Sport.find(params[:id])
  end

  # POST /sports
  # POST /sports.json
  def create
    @sport = Sport.new(params[:sport])

    respond_to do |format|
      if @sport.save
        format.html { redirect_to @sport, notice: 'Sport was successfully created.' }
        format.json { render json: @sport, status: :created, location: @sport }
      else
        format.html { render action: "new" }
        format.json { render json: @sport.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sports/1
  # PUT /sports/1.json
  def update
    @sport = Sport.find(params[:id])

    respond_to do |format|
      if @sport.update_attributes(params[:sport])
        format.html { redirect_to @sport, notice: 'Sport was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sport.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sports/1
  # DELETE /sports/1.json
  def destroy
    @sport = Sport.find(params[:id])
    @sport.destroy

    respond_to do |format|
      format.html { redirect_to sports_url }
      format.json { head :no_content }
    end
  end
end
