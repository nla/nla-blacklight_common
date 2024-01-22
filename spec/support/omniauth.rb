require "omniauth"

OmniAuth.config.test_mode = true

RSpec.configure do |config|
  config.before do
    OmniAuth.config.add_mock(:catalogue_patron, JSON.parse(IO.read("spec/files/auth/auth_hash.json")))
    OmniAuth.config.add_mock(:catalogue_sol, JSON.parse(IO.read("spec/files/auth/catalogue_sol_auth_hash.json")))
  end
end
