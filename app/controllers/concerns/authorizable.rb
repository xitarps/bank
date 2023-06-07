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
        'taxes' => {
          'index' => true,
          'create' => true,
          'new' => true,
          'edit' => true,
          'show' => true,
          'update' => true,
          'destroy' => true
        },
        'contact_lists' => {
          'show' => true,
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
        'administrators' => {
          'index' => true,
          'new' => true,
          'create' => true,
          'edit' => true,
          'show' => true,
          'update' => true,
          'destroy' => true
        },
        'accounts' => {
          'index' => true,
          'edit' => true,
          'show' => true,
          'update' => true,
          'destroy' => true
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
        'transfers' => {
          'index' => true,
          'new' => true,
          'create' => true,
          'show' => true
        }
      },
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
          'edit' => true,
          'show' => true,
          'update' => true,
          'destroy' => true
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
          'new' => true,
          'create' => true,
          'show' => true
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
        }
      }
    }
  end
end
