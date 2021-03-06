class ArticlesController < ApplicationController

	# http_basic_authenticate_with name: "dhh", password: "secret",
	#  except: [:index, :show]
	#  Este ejemplo de arriba es muy básico, solo vale para un unico name y password que
	#  se pone aqui y ya está, por eso usamos Devise que es una gema muy completa.

	before_action :authenticate_user!

	def index
		@articles = Article.all
		@users = User.all
	end

	def show
		@article = Article.find(params[:id])
	end


	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		@article.user = current_user 

 
       if @article.save
       	  @article.user.update_attributes(:num_articles => @article.user.num_articles + 1)
          redirect_to @article
      else
      	render 'new'
      end
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end

	private

		def article_params
			params.require(:article).permit(:title, :text)		
		end
end
