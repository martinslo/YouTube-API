module Api::V1
 class ApiController < ApplicationController
   # Verificar se o usuário que está acessando a API é um usuário válido no banco
   acts_as_token_authentication_handler_for User
   before_action :require_authentication!

     private
        def require_authentication!
            throw(:warden, scope: :user) unless current_user.presence
        end
    end
end