class HomeController < ApplicationController
  def new; end

  def submit
    @response = BlockchainService.new(blockchain_name).submit_to_blockchain(data: badge_params.to_h)

    respond_to do |format|
      # render any error returned from Chainpoint blockchain
      if @response["message"]
        format.js { render :new }
      else
        format.js
      end
    end
  end

  def success; end

  private

  def badge_params
    params.require(:badge).permit([:issue_date, :recipient_name, :uuid])
  end

  # blockchain service is set as a hidden field on form -> see home/new.html.erb
  # here :chainpoint is set as a default/fallback blockchain
  def blockchain_name
    params[:blockchain]&.to_sym || :chainpoint
  end
end
