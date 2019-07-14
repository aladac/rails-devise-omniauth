# frozen_string_literal: true

Devise.setup do |config|
  # config.secret_key = '1654771dc52a0e10d822a5b9ac434fbd4f351c5039bdf847608a422a85e3405cc3cd70a53d1339bb5f196312ad942f4477eea623097ab0453cd62af0fd920e98'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete

  # ==> OmniAuth
  config.omniauth :google_oauth2, +'186524201897-gcsu37j8nk30sf2onuvqho21lsc8nma2.apps.googleusercontent.com', +'hmHIbKzgyNVdxaw7IvICYZID'
  config.omniauth :facebook, +'348550675839707', +'962149a9a775834ade5af399e9aa3e8d'
  config.omniauth :twitter, +'I3swIMQiMTdyY33OphBj2tUOV', +'BN8WREZQjHV5slaQF0tMcLWjXQW1qAIwX1ddr2h4ZmvssOPzZD'
  config.omniauth :github, +'b344f11e64327a2d6f60', +'1d5f4cc619535c446435059d2fb6b8ca3a33d877'
  config.omniauth :linkedin, +'77uwd9gfbfai22', +'JRgaTqS7tucL3FhD'
end
