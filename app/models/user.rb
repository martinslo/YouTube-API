class User < ApplicationRecord
  # Estendendo as propriedades do Devise para usar token
  acts_as_token_authenticatable
    
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
  # Caso o usuário seja excluído, os vídeos relacionados ao usuário serão excluídos também
  has_many :videos, dependent: :destroy
end
