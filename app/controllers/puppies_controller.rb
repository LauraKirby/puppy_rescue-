class PuppiesController < ApplicationController
  
  def index
  	@puppies = Puppy.all
  end

  def show
  	@puppy = Puppy.find_by_id params[:id]
  end

  def new
  	@puppy = Puppy.new
  end

  def create
  	@puppy = Puppy.new puppy_params
  	if @puppy.save 
  		redirect_to puppies_path
  	else 
  		render :new
  	end 
  end

  def update
  	@puppy = Puppy.find_by_id params[:id]
  	@puppy.update puppy_params
  		if @puppy.save 
  			redirect_to puppy_path(@puppy)
  		else 
  			render :edit
  		end 
  end 

  def edit
  	@puppy = Puppy.find_by_id(params[:id])
  	render :edit
  end

  def destroy
  	@puppy = Puppy.find_by_id(params[:id])
  	@puppy.destroy
  	redirect_to puppies_path
  end 

private 

  def puppy_params
  	params.require(:puppy).permit(:name, :image, :breed, :bio, :age)
  end


end
