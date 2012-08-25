class RegistrationsController < Devise::RegistrationsController

  protected

  def build_resource(hash = nil)
    hash ||= resource_params || {}
    self.resource = resource_class.new_with_session(hash, session)
    self.resource.generate_token!
  end

  def after_sign_up_path_for(resource)
    '/token'
  end
end
