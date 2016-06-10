class CategoriesController < ApplicationController
	def index
		@categories = Category.all
	end

	def show
		@category = Category.find(params[:id])
	end

	def edit
		@category = Category.find(params[:id])
	end

	def new
		@category = Category.new
	end

	def create		
		@category = Category.new(name: params[:category][:name],description: params[:category][:description])
		if @category.save 
			redirect_to categories_path #redirecciona al listado
		else
			render :new
		end	
	end

	def update		
		@category = Category.find(params[:id])
		if @category.update(name: params[:category][:name], description: params[:category][:description])	
			redirect_to categories_path
		else
			render :edit
		end
	end
#acción destroy del método delete
	def destroy
		@category = Category.find(params[:id]) #necesita saber cual va a llevarse al carajo ;)
		@category.destroy

		redirect_to categories_path
	end
end