function dc --wraps='docker compose' --wraps=docker-compose --description 'alias dc=docker-compose'
  docker-compose $argv; 
end
