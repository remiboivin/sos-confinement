# == Route Map
#
#                                Prefix Verb   URI Pattern                                                                              Controller#Action
#                     new_user_password GET    /users/password/new(.:format)                                                            devise/passwords#new
#                    edit_user_password GET    /users/password/edit(.:format)                                                           devise/passwords#edit
#                         user_password PATCH  /users/password(.:format)                                                                devise/passwords#update
#                                       PUT    /users/password(.:format)                                                                devise/passwords#update
#                                       POST   /users/password(.:format)                                                                devise/passwords#create
#                 new_user_registration GET    /s-inscrire(.:format)                                                                    user/registrations#new
#                     user_registration POST   /s-inscrire(.:format)                                                                    user/registrations#create
#                      new_user_session GET    /se-connecter(.:format)                                                                  user/sessions#new
#                          user_session POST   /se-connecter(.:format)                                                                  user/sessions#create
#                  user_destroy_session GET    /se-deconnecter(.:format)                                                                user/sessions#destroy
#                                  root GET    /                                                                                        home#index
#                                 admin GET    /admin(.:format)                                                                         admin#index
#                                profil GET    /profil(.:format)                                                                        dashboard#index
#                            historique GET    /historique(.:format)                                                                    home#about
#                         nous_soutenir GET    /nous-soutenir(.:format)                                                                 home#support
#                        nous_contacter GET    /nous-contacter(.:format)                                                                home#contact
#                                              /*path(.:format)                                                                         errors#error_404
#                            user_index GET    /user(.:format)                                                                          user#index
#                                       POST   /user(.:format)                                                                          user#create
#                                  user GET    /user/:id(.:format)                                                                      user#show
#         rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
#         rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
#            rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
#         rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
#          rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
#        rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
#                                       POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
#     new_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/new(.:format)                             rails/conductor/action_mailbox/inbound_emails#new
#    edit_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                        rails/conductor/action_mailbox/inbound_emails#edit
#         rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
#                                       PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
# rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
#                    rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#             rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                    rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#             update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                  rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do

  ## ROUTES FOR DOCTORS ##

  devise_for :doctors, path: 'doctors',
      controllers: {
        sessions: 'doctors/sessions',
        confirmations: 'doctors/confirmations',
        passwords: 'doctors/passwords',
        registrations:'doctors/registrations',
        unlocks: 'doctors/unlocks',
      }, :skip => [:registrations, :sessions]

  devise_scope :doctor do
    get '/docteur/s-inscrire', to: "doctors/registrations#new", as: :new_doctor_registration
    post '/docteur/s-inscrire', to: "doctors/registrations#create", as: :doctor_registration
    get '/docteur/se-connecter', to: "doctors/sessions#new", as: :new_doctor_session
    post '/docteur/se-connecter', to: "doctors/sessions#create", as: :doctor_session
    get '/docteur/se-deconnecter', to: 'doctors/sessions#destroy', as: :doctor_destroy_session
  end

      ## ROUTES FOR USERS ##

  devise_for :users, path: 'users',
      controllers: {
        sessions: 'users/sessions',
        confirmations: 'users/confirmations',
        passwords: 'users/passwords',
        registrations:'users/registrations',
        unlocks: 'users/unlocks',
      }, :skip => [:registrations, :sessions]

  devise_scope :user do
    get '/utilisateur/s-inscrire', to: "users/registrations#new", as: :new_user_registration
    post '/utilisateur/s-inscrire', to: "users/registrations#create", as: :user_registration
    get '/utilisateur/se-connecter', to: "users/sessions#new", as: :new_user_session
    post '/utilisateur/se-connecter', to: "users/sessions#create", as: :user_session
    get '/utilisateur/se-deconnecter', to: 'users/sessions#destroy', as: :user_destroy_session
  end

  root to: 'home#index'

  ## ROUTES FOR PAGES ##

  # get '/admin',           to: 'admin#index'
  # get '/profil',          to: 'dashboard#index'
  get '/qui_sommes_nous', to: 'home#about'
  get '/nous_soutenir',   to: 'home#support'
  get '/nous_contacter',  to: 'home#contact'

  ## ROUTES FOR ALERTS ##
  resources :alerts, only: [:new, :create, :edit, :update, :destroy] do
    get '/gestion_attente',   to: 'alert#attente'
  end

  ## ROUTES FOR PATIENTS ##

  resources :patients, only: [:index, :new, :create, :destroy]

  match "*route_not_found", to: "application#not_found", via: :all
  match "*internal_server_error", to: "application#internal_server_error", via: :all

end
