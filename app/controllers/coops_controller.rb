class CoopsController < ApplicationController
  before_action :find_coop, only: [:show, :edit, :update, :destroy]

  def index
	if params[:major].blank?
	  @coops = Coop.all.order("created_at DESC")
	else
	  @major_id = Major.find_by(name: params[:major]).id
	  @coops = Coop.where(:major_id => @major_id).order("created_at DESC")
	end 
  end

  def show
  end
  
  def new
	@coop = current_user.coops.build
	@majors = Major.all.map{ |c| [c.name, c.id]}
  end

  def create
	@coop = current_user.coops.build(coop_params)
	@coop.major_id = params[:major_id]
	if @coop.save
	  redirect_to root_path
	else
	  render 'new'
	end
  end

  def edit
	@majors = Major.all.map{ |c| [c.name, c.id]}
  end

  def update
	@coop.major_id = params[:major_id]
	if @coop.update(coop_params)
	  redirect_to coop_path(@coop)
	else
	  render 'edit'
	end
  end

  def destroy
	@coop.destroy
	redirect_to root_path
  end

  private
	
    def coop_params
	  params.require(:coop).permit(:title, :description, :company)
	end
	
	def find_coop
	  @coop = Coop.find(params[:id])
	end
  
end
