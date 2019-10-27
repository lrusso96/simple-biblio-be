# frozen_string_literal: true

# Simple wrapper of render json
module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end
end