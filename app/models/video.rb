class Video < ApplicationRecord
  belongs_to :user
    
  # Validação de usuário, só aceita videos com título, url e usuário presente
  validates :titulo, :url, :user, presence: true
end
