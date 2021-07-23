class HomeController < ApplicationController
  def new; end

  def submit
    binding.pry

    response = BlockchainService.new(blockchain).submit_to_blockchain(data: badge_params)

    respond_to do |format|
      format.json { render json: response }
    end
  end

  private

  def badge_params
    params.require(:badge).permit([:blockchain, :issue_date, :recipient_name, :uuid])
  end

  # blockchain service is set as a hidden field on form -> see home/new.html.erb
  # here :chainpoint is set as a default/fallback blockchain
  def blockchain
    params[:blockchain]&.to_sym || :chainpoint
  end
end
