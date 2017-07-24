class CerealsController < ApplicationController
  before_action :set_cereal, only: [:show, :edit, :update, :destroy]

  # GET /cereals
  # GET /cereals.json
  def index
    @cereals = Cereal.all
  end

  # GET /cereals/1
  # GET /cereals/1.json
  def show
  end

  # GET /cereals/new
  def new
    @cereal = Cereal.new
  end

  # GET /cereals/1/edit
  def edit
  end

  # POST /cereals
  # POST /cereals.json
  def create
    @cereal = Cereal.new(cereal_params)

    respond_to do |format|
      if @cereal.save
        format.html { redirect_to @cereal, notice: 'Cereal was successfully created.' }
        format.json { render :show, status: :created, location: @cereal }
      else
        format.html { render :new }
        format.json { render json: @cereal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cereals/1
  # PATCH/PUT /cereals/1.json
  def update
    respond_to do |format|
      if @cereal.update(cereal_params)
        format.html { redirect_to @cereal, notice: 'Cereal was successfully updated.' }
        format.json { render :show, status: :ok, location: @cereal }
      else
        format.html { render :edit }
        format.json { render json: @cereal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cereals/1
  # DELETE /cereals/1.json
  def destroy
    @cereal.destroy
    respond_to do |format|
      format.html { redirect_to cereals_url, notice: 'Cereal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cereal
      @cereal = Cereal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cereal_params
      params.fetch(:cereal, {})
    end
end
