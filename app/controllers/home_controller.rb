class HomeController < ApplicationController
  def new; end

  def submit
    response = BlockchainService.new(blockchain_name).submit_to_blockchain(data: badge_params.to_h)
    puts response
    respond_to do |format|
      format.json { render json: { code: response["code"], data: response, message: response["message"] } }
    end
  end

  def success; end

  private

  def badge_params
    params.require(:home).permit([:issue_date, :recipient_name, :uuid])
  end

  # blockchain service is set as a hidden field on form -> see home/new.html.erb
  # here :chainpoint is set as a default/fallback blockchain
  def blockchain_name
    params[:blockchain]&.to_sym || :chainpoint
  end
end
