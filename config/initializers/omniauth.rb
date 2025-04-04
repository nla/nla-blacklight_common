Rails.application.config.middleware.use OmniAuth::Builder do
  provider :keycloak_openid,
    ENV.fetch("KC_SPL_CLIENT", "catalogue"),
    ENV.fetch("KC_SPL_SECRET", "default secret"),
    client_options: {site: ENV.fetch("KEYCLOAK_URL", "http://localhost:9090"), realm: ENV.fetch("KC_SPL_REALM", "catalogue_spl"), base_url: ENV.fetch("KC_BASE_URL", "/auth")},
    strategy_class: OmniAuth::Strategies::KeycloakOpenId,
    authorize_params: {scope: "openid"},
    name: "catalogue_spl"

  provider :keycloak_openid,
    ENV.fetch("KC_SOL_CLIENT", "catalogue"),
    ENV.fetch("KC_SOL_SECRET", "default secret"),
    client_options: {site: ENV.fetch("KEYCLOAK_URL", "http://localhost:9090"), realm: ENV.fetch("KC_SOL_REALM", "catalogue_sol"), base_url: ENV.fetch("KC_BASE_URL", "/auth")},
    strategy_class: OmniAuth::Strategies::KeycloakOpenId,
    authorize_params: {scope: "openid"},
    name: "catalogue_sol"

  provider :keycloak_openid,
    ENV.fetch("KC_SHARED_CLIENT", "catalogue"),
    ENV.fetch("KC_SHARED_SECRET", "default secret"),
    client_options: {site: ENV.fetch("KEYCLOAK_URL", "http://localhost:9090"), realm: ENV.fetch("KC_SHARED_REALM", "catalogue_shared"), base_url: ENV.fetch("KC_BASE_URL", "/auth")},
    strategy_class: OmniAuth::Strategies::KeycloakOpenId,
    authorize_params: {scope: "openid"},
    name: "catalogue_shared"

  provider :keycloak_openid,
    ENV.fetch("KC_PATRON_CLIENT", "patron"),
    ENV.fetch("KC_PATRON_SECRET", "default secret"),
    client_options: {site: ENV.fetch("KEYCLOAK_URL", "http://localhost:9090"), realm: ENV.fetch("KC_PATRON_REALM", "nla-patron"), base_url: ENV.fetch("KC_BASE_URL", "/auth")},
    strategy_class: OmniAuth::Strategies::KeycloakOpenId,
    authorize_params: {scope: "openid"},
    name: "catalogue_patron"
end
