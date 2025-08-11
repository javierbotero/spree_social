module Spree
  module UserRegistrationsControllerDecorator
    def self.prepend(base)
      base.after_action :clear_omniauth, only: :create
    end

    private

    def build_resource(*args)
      super
      @spree_user.apply_omniauth(session[:omniauth]) if session[:omniauth]
      @spree_user
    end

    def clear_omniauth
      session[:omniauth] = nil unless @spree_user.new_record?
    end
  end
end

Rails.application.config.to_prepare do
  require_dependency 'spree/user_registrations_controller'
  ::Spree::UserRegistrationsController.prepend(Spree::UserRegistrationsControllerDecorator)
end
