# frozen_string_literal: true

##
# This class wraps a set of controllers to manage the "/ebooks/*" paths.
class EbooksController < ApplicationController
  ##
  # Let the current user to rate an ebook.
  #
  # @return the ebook
  #
  # == Request
  # [POST] /ebooks/rate {params}
  #
  # == Supported parameters
  # [ebook] ebook identifier, unique per provider
  # [provider] provider identifier
  # [rating] ebook score given by the current user
  def rate
    validate_rate_params
    ebook = download_ebook params
    ebook.liked_by current_user, vote_weight: params[:rating]
    json_response ebook
  end

  ##
  # Retrieve stats about an ebooks.
  #
  # @return the stats
  #
  # == Request
  # [POST] /ebooks/stats {params}
  #
  # == Supported parameters
  # [ebook] ebook identifier, unique per provider
  # [provider] provider identifier
  def stats
    validate_stats_params
    ebook = download_ebook params
    json_response ebook
  end

  ##
  # Let the current user to add an ebook to its downloads.
  #
  # @return EbookReader instance associated with current user and the ebook.
  #
  # == Request
  # [POST] /ebooks/download {params}
  #
  # == Supported parameters
  # [ebook] ebook identifier, unique per provider
  # [provider] provider identifier
  def download
    validate_download_params
    ebook = download_ebook params
    er = EbookReader.find_by ebook: ebook, user: current_user
    er ||= EbookReader.create! ebook: ebook, user: current_user
    json_response er
  end

  private

  ##
  # Download an ebook if not present in the db.
  #
  # @param [ActionController::Params] par
  # @return [Ebook] the ebook.
  #
  def download_ebook(par)
    rel_id = par[:ebook]
    prov_id = par[:provider]
    ebook = Ebook.find_by rel_id: rel_id, provider_id: prov_id

    unless ebook
      ebook = get_downloader(prov_id)&.search rel_id
      ebook.save!
    end
    ebook
  end

  def get_downloader(id)
    providers = [Feedbooks, Libgen, StandardEbooks]
    providers[id.to_i - 1]
  end

  def validate_rate_params
    params.require %i[ebook provider rating]
  end

  def validate_stats_params
    params.require %i[ebook provider]
  end

  def validate_download_params
    params.require %i[ebook provider]
  end
end
