class CommentsController < ApplicationController

	# http_basic_authenticate_with name: "dhh", password: "secret",
	# only: :destroy   --> esto haría q en comments podría hacer destroy solo el name dhh con su password 
	#  Este ejemplo de arriba es muy básico, solo vale para un unico name y password que
	#  se pone aqui y ya está, por eso usamos Devise que es muuuuucho mas completo.

	def create
		@article = Article.find(params[:article_id])	
		@comment = @article.comments.create(comment_params)
		redirect_to article_path(@article)
	end

	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article)
	end

	def comment_params
		params.require(:comment).permit(:commenter, :body)
	end
end
