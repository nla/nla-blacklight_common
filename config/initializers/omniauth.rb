Rails.application.config.middleware.use OmniAuth::Builder do
  provider :keycloak_openid,
    ENV.fetch("KC_SPL_CLIENT", "catalogue"),
    ENV.fetch("KC_SPL_SECRET", "default secret"),
    client_options: {site: ENV.fetch("KEYCLOAK_URL", "http://localhost:9090"), realm: ENV.fetch("KC_SPL_REALM", "staff_spl")},
    strategy_class: OmniAuth::Strategies::KeycloakOpenId,
    name: "staff_spl"

  provider :keycloak_openid,
    ENV.fetch("KC_SOL_CLIENT", "catalogue"),
    ENV.fetch("KC_SOL_SECRET", "default secret"),
    client_options: {site: ENV.fetch("KEYCLOAK_URL", "http://localhost:9090"), realm: ENV.fetch("KC_SOL_REALM", "staff_sol")},
    strategy_class: OmniAuth::Strategies::KeycloakOpenId,
    name: "staff_sol"

  provider :keycloak_openid,
    ENV.fetch("KC_SHARED_CLIENT", "catalogue"),
    ENV.fetch("KC_SHARED_SECRET", "default secret"),
    client_options: {site: ENV.fetch("KEYCLOAK_URL", "http://localhost:9090"), realm: ENV.fetch("KC_SHARED_REALM", "staff_shared")},
    strategy_class: OmniAuth::Strategies::KeycloakOpenId,
    name: "staff_shared"
end
