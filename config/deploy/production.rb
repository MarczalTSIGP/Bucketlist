set :stage, :production

server '167.99.11.61', roles: %w(app web db), primary: true, user: 'deployer'
set :rails_env, "production"
