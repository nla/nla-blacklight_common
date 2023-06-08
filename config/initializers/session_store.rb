Rails.application.config.session_store :active_record_store, key: "_catalogue_session", secure: Rails.env.production?, httponly: true, samesite: {lax: true}

# This needs to be set after initialisation, otherwise the model classes won't be loaded
# and an error will be thrown regarding CatalogueSession not being found.
Rails.configuration.after_initialize do
  ActionDispatch::Session::ActiveRecordStore.session_class = CatalogueSession
end
