Rails.application.config.middleware.use OmniAuth::Builder do
  provider :keycloak_openid,
    ENV.fetch("KC_SPL_CLIENT", "catalogue"),
    ENV.fetch("KC_SPL_SECRET", "default secret"),
    client_options: {site: ENV.fetch("KEYCLOAK_URL", "http://localhost:9090"), realm: ENV.fetch("KC_SPL_REALM", "catalogue_spl")},
    strategy_class: OmniAuth::Strategies::KeycloakOpenId,
    authorize_params: {scope: "openid"},
    name: "catalogue_spl"

  provider :keycloak_openid,
    ENV.fetch("KC_SOL_CLIENT", "catalogue"),
    ENV.fetch("KC_SOL_SECRET", "default secret"),
    client_options: {site: ENV.fetch("KEYCLOAK_URL", "http://localhost:9090"), realm: ENV.fetch("KC_SOL_REALM", "catalogue_sol")},
    strategy_class: OmniAuth::Strategies::KeycloakOpenId,
    authorize_params: {scope: "openid"},
    name: "catalogue_sol"

  provider :keycloak_openid,
    ENV.fetch("KC_SHARED_CLIENT", "catalogue"),
    ENV.fetch("KC_SHARED_SECRET", "default secret"),
    client_options: {site: ENV.fetch("KEYCLOAK_URL", "http://localhost:9090"), realm: ENV.fetch("KC_SHARED_REALM", "catalogue_shared")},
    strategy_class: OmniAuth::Strategies::KeycloakOpenId,
    authorize_params: {scope: "openid"},
    name: "catalogue_shared"
end
