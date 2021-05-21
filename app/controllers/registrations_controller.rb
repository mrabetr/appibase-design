class RegistrationsController < Devise::RegistrationsController
  # POST /resource
  def create
    build_resource(sign_up_params)
    resource.save!
    # Signs in a user on sign up.
    sign_up(resource_name, resource) if resource.persisted?

    render json: resource, status: :created
  # rescue ActiveRecord::RecordInvalid => e
  #   render json: { errors: e.record.errors }, status: :unprocessable_entity

    # if resource.save
    #   render json: resource, status: :created
    # else
    #   clean_up_passwords resource
    #   set_minimum_password_length
    #   render json: { errors: resource.errors }, status: :unprocessable_entity
    # end
  end

  # # PUT /resource
  # def update
  #   self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)

  #   resource_updated = update_resource(resource, account_update_params)
  #   bypass_sign_in resource, scope: resource_name if resource_updated && sign_in_after_change_password?

  #   render json: resource, status: :ok
  # end

  # def destroy
  #   resource.destroy
  #   Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
  #   head :no_content
  # end
end
