class ConversionsController < ApplicationController
  before_action :set_conversion, only: %i[ show edit update destroy ]

  # GET /conversions or /conversions.json
  def index
    @conversions = Conversion.all
  end

  # GET /conversions/1 or /conversions/1.json
  def show
  end

  # GET /conversions/new
  def new
    @conversion = Conversion.new
  end

  # GET /conversions/1/edit
  def edit
  end

  # POST /conversions or /conversions.json
  def create
    @conversion = Conversion.new(conversion_params)

    respond_to do |format|
      if @conversion.save
        format.html { redirect_to @conversion, notice: "Conversion was successfully created." }
        format.json { render :show, status: :created, location: @conversion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @conversion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conversions/1 or /conversions/1.json
  def update
    respond_to do |format|
      if @conversion.update(conversion_params)
        format.html { redirect_to @conversion, notice: "Conversion was successfully updated." }
        format.json { render :show, status: :ok, location: @conversion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @conversion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conversions/1 or /conversions/1.json
  def destroy
    @conversion.destroy!

    respond_to do |format|
      format.html { redirect_to conversions_path, status: :see_other, notice: "Conversion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversion
      @conversion = Conversion.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def conversion_params
      params.expect(conversion: [ :affiliate_link_id, :click_id, :amount ])
    end
end
