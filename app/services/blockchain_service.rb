class BlockchainService

  def initialize(blockchain: :chainpoint, data:)
    @service = set_service(service_name: service_name, data: data)
  end

  def submit_to_blockchain
    if @service
      @service.submit_to_blockchain
    end
  end

  def verify_from_blockchain
    if @service
      @service.verify_from_blockchain
    end
  end

  private

  # This method intends to make it easy to connect to other blockchains
  def set_service(service_name:, data:)
    return nil unless data

    case service_name
    when :chainpoint
      ::ChainpointBlockchainService.new(data)
    else
      nil
    end
  end

end