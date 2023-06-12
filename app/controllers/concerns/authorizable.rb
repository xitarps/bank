module Authorizable
  extend ActiveSupport::Concern

  private

  def authenticate_and_authorize!
    authenticate_user!

    return if current_user.userable_type == 'Root'

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
      'Administrator' => {
        'taxes' => {
          'index' => true,
          'create' => true,
          'new' => true,
          'edit' => true,
          'show' => true,
          'update' => true,
          'destroy' => true
        },
        'accounts' => {
          'index' => true,
          'show' => true
        },
        'classrooms' => {
          'index' => true,
          'new' => true,
          'create' => true,
          'edit' => true,
          'show' => true,
          'update' => true,
          'destroy' => true
        },
        'products' => {
          'index' => true,
          'create' => true,
          'new' => true,
          'edit' => true,
          'show' => true,
          'update' => true,
          'destroy' => true
        },
        'transfers' => {
          'index' => true,
          'show' => true
        },
        'investments' => {
          'index' => true
        }
      },
      'Customer' => {
        'contact_lists' => {
          'show' => true,
          'destroy' => true
        },
        'accounts' => {
          'show' => true
        },
        'transfers' => {
          'index' => true,
          'new' => true,
          'create' => true,
          'show' => true
        },
        'investments' => {
          'index' => true,
          'new' => true,
          'create' => true,
          'edit' => true,
          'show' => true,
          'update' => true,
          'destroy' => true
        },
        'products' => {
          'index' => true,
          'show' => true
        }
      }
    }
  end
end
