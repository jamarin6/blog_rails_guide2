class Article < ActiveRecord::Base
	has_many :comments, dependent: :destroy     #esto permite que cuando borremos un articulo lo haga tambien sus comentarios
	belongs_to :user
	validates :title, presence: true,
					  length: { minimum: 5 }
end
