# frozen_string_literal: true

# Manages the /ebooks/* paths
class EbooksController < ApplicationController
  # GET /ebooks/rate
  def rate
    # TODO: implement controller
    validate_rate_params
    ebook = Ebook.new
    ebook.id = params[:ebook]
    json_response(ebook)
  end

  # POST /ebooks/download
  def download
    # TODO: add 'provider_id' field in params
    # TODO: handle more providers
    validate_download_params
    rel_id = params[:ebook]
    ebook = Ebook.find_by(rel_id: rel_id)

    unless ebook
      ebook = Libgen.search(rel_id)
      ebook.save!
    end

    EbookReader.create!(ebook: ebook, user: current_user)
    json_response(ebook)
  end

  private

  def validate_rate_params
    params.require(%i[ebook provider rating])
  end

  def validate_download_params
    params.require(%i[ebook provider])
  end
end
