# frozen_string_literal: true

Rails.application.routes.draw do
  post 'ebooks/rate', to: 'ebooks#rate'
  post 'ebooks/download', to: 'ebooks#download'

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
