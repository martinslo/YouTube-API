class Rack::Attack
 Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new
    
 # Habilitar o tráfego para o localhost
 safelist('allow-localhost') do |req|
   '127.0.0.1' == req.ip || '::1' == req.ip
 end
   
 # Habilitar um IP para fazer 5 requests em 5 segundos
 throttle('req/ip', limit: 5, period: 5) do |req|
   req.ip
 end
    
 # Proteger a API de Brute Force, limitando as chamadas de login para um mesmo e-mail em 5 a cada 20 segundos
 throttle("logins/email", limit: 5, period: 20.seconds) do |req|
   if req.path == '/users/sign_in' && req.post?
     req.params['email'].presence
   end
 end
end