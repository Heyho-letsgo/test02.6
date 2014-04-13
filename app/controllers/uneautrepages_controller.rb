class UneautrepagesController < ApplicationController

  #->Prelang (scaffolding:rails/scope_to_user)
  before_filter :require_user_signed_in, only: [:new, :edit, :create, :update, :destroy]

  before_action :set_uneautrepage, only: [:show, :edit, :update, :destroy]

  # GET /uneautrepages
  # GET /uneautrepages.json
  def index
    @uneautrepages = Uneautrepage.all
  end

  # GET /uneautrepages/1
  # GET /uneautrepages/1.json
  def show
  end

  # GET /uneautrepages/new
  def new
    @uneautrepage = Uneautrepage.new
  end

  # GET /uneautrepages/1/edit
  def edit
  end

  # POST /uneautrepages
  # POST /uneautrepages.json
  def create
    @uneautrepage = Uneautrepage.new(uneautrepage_params)

    respond_to do |format|
      if @uneautrepage.save
        format.html { redirect_to @uneautrepage, notice: 'Uneautrepage was successfully created.' }
        format.json { render action: 'show', status: :created, location: @uneautrepage }
      else
        format.html { render action: 'new' }
        format.json { render json: @uneautrepage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uneautrepages/1
  # PATCH/PUT /uneautrepages/1.json
  def update
    respond_to do |format|
      if @uneautrepage.update(uneautrepage_params)
        format.html { redirect_to @uneautrepage, notice: 'Uneautrepage was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @uneautrepage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uneautrepages/1
  # DELETE /uneautrepages/1.json
  def destroy
    @uneautrepage.destroy
    respond_to do |format|
      format.html { redirect_to uneautrepages_url }
      format.json { head :no_content }
    end
  end


  #->Prelang (voting/acts_as_votable)
  def vote

    direction = params[:direction]

    # Make sure we've specified a direction
    raise "No direction parameter specified to #vote action." unless direction

    # Make sure the direction is valid
    unless ["like", "bad"].member? direction
      raise "Direction '#{direction}' is not a valid direction for vote method."
    end

    @uneautrepage.vote voter: current_user, vote: direction

    redirect_to index
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_uneautrepage
      @uneautrepage = Uneautrepage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def uneautrepage_params
      params.require(:uneautrepage).permit(:civilite, :prenom, :nom)
    end
end
