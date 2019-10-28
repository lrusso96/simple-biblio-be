# frozen_string_literal: true

# Manages the /ebooks/* paths
class EbooksController < ApplicationController
  # GET /ebooks/rate
  def rate
    # TODO: implement controller
    validate_rate_params
    ebook = Ebook.new
    ebook.id = params[:id]
    json_response(ebook)
  end

  # POST /ebooks/download
  def download
    # TODO: implement controller
    validate_download_params
    ebook = Ebook.new
    ebook.id = params[:id]
    json_response(ebook)
  end

  private

  def validate_rate_params
    # simple validation of search parameters
    params.require(%i[id rating])
    params.permit(%i[id rating])
  end

  def validate_download_params
    # simple validation of search parameters
    params.require(:id)
    params.permit(:id)
  end
end
