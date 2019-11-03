# frozen_string_literal: true

Rails.application.routes.draw do
  post 'signup', to: 'users#create'
  post 'auth/login', to: 'authentication#authenticate'

  post 'ebooks/download', to: 'ebooks#download'
  post 'ebooks/rate', to: 'ebooks#rate'
end
