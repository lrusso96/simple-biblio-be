# frozen_string_literal: true

FirebaseIdToken.configure do |config|
  id = ENV['FIREBASE_ID']
  config.project_ids = [id]
end