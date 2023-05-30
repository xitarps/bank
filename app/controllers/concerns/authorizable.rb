module Authorizable
  extend ActiveSupport::Concern

  private

  def authenticate_and_authorize!
    authenticate_user!
    authorized = !!authorizations.dig(current_user.userable_type, controller_name, action_name)
    render 'home/index' unless authorized
  end

  def authorizations
    # {
    #   'ClassName' => {
    #     'contoller_name' => {
    #       'action_name' => true/false
    #     }
    #   }
    # }
    {
      'Root' => {
        'contact_lists' => {
          'show' => true,
          'destroy' => true
        }
      },
      'Customer' => {
        'contact_lists' => {
          'show' => true,
          'destroy' => true
        }
      }
    }
  end
end
