class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  	
  # GET /people
  # GET /people.json
  def index
	set_css_active("list")
    @people = Person.all
	@person = Person.new
  end
  
  def home  	
	set_css_active("home")
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end

  # GET /people/new
  def new
	set_css_active("new")
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
		format.js   { render action: 'show', status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
		# added:
        format.js   { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:first_name, :last_name)
    end
	
	def set_css_active(page)
		if page == "new"
			@ccs_active_list = ""
			@ccs_active_new = "active"
			@ccs_active_home = ""
		elsif page == "list"
			@ccs_active_list = "active"
			@ccs_active_new = ""
			@ccs_active_home = ""
		else
			@ccs_active_list = ""
			@ccs_active_new = ""
			@ccs_active_home = "active"
		end
	end 
end
