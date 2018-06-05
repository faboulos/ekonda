class ConfirmationsController <Devise::ConfirmationsController

    private
    def after_confirmation_path_for(resources_name, resource)
        edit_user_registration_path
    end
end