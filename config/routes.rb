# frozen_string_literal: true

Rails.application.routes.draw do
  post 'ebooks/rate', to: 'ebooks#rate'
  post 'ebooks/download', to: 'ebooks#download'
end
