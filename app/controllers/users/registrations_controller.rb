# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]
    before_action :build_dog, only: [:new]

    # GET /resource/sign_up
    # def new
    #   super
    # end

    # POST /resource
    def create
      super do |resource|
        if resource.persisted?
          # Ne rien faire si l'utilisateur n'a pas fourni de photo
          # Les photos par défaut seront utilisées dans les vues
        end
      end
    end

    # GET /resource/edit
    # def edit
    #   super
    # end

    # PUT /resource
    def update
      self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
      prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

      resource_updated = update_resource(resource, account_update_params)
      yield resource if block_given?

      if resource_updated
        set_flash_message_for_update(resource, prev_unconfirmed_email)
        bypass_sign_in resource, scope: resource_name if sign_in_after_change_password?

        respond_with resource, location: after_update_path_for(resource)
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
    end

    # DELETE /resource
    # def destroy
    #   super
    # end

    # GET /resource/cancel
    # Forces the session data which is usually expired after sign
    # in to be expired now. This is useful if the user wants to
    # cancel oauth signing in/up in the middle of the process,
    # removing all OAuth session data.
    # def cancel
    #   super
    # end

    # protected

    # The path used after sign up.
    def after_sign_up_path_for(resource)
      root_path
    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up,
                                        keys: [:first_name, :last_name, :avatar, { dog_attributes: %i[name photo] }])
    end

    # If you have extra params to permit, append them to the sanitizer.
    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update,
                                        keys: [:first_name, :last_name, :avatar,
                                               { dog_attributes: %i[id name species date_of_birth description photo] }])
    end

    # Initialiser l'objet Dog
    def build_dog
      return unless params[:user] && params[:user][:dog_attributes].present?

      build_resource.dog ||= Dog.new
    end

    # The path used after sign up for inactive accounts.
    # def after_inactive_sign_up_path_for(resource)
    #   super(resource)
    # end
  end
end
