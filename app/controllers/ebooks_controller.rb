# frozen_string_literal: true

# Manages the /ebooks/* paths
class EbooksController < ApplicationController
  # GET /ebooks/rate
  def rate
    validate_rate_params
    ebook = download_ebook params
    ebook.liked_by current_user, vote_weight: params[:rating]
    json_response(ebook)
  end

  # POST /ebooks/download
  def download
    validate_download_params
    ebook = download_ebook params
    er = EbookReader.find_by(ebook: ebook, user: current_user)
    er ||= EbookReader.create!(ebook: ebook, user: current_user)
    json_response(er)
  end

  private

  def download_ebook(par)
    rel_id = par[:ebook]
    prov_id = par[:provider]
    ebook = Ebook.find_by(rel_id: rel_id, provider_id: prov_id)

    unless ebook
      ebook = get_downloader(prov_id)&.search(rel_id)
      ebook.save!
    end
    ebook
  end

  def get_downloader(id)
    providers = [Libgen, Feedbooks]
    providers[id.to_i - 1]
  end

  def validate_rate_params
    params.require(%i[ebook provider rating])
  end

  def validate_download_params
    params.require(%i[ebook provider])
  end
end
