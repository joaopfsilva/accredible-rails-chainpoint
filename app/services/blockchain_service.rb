class BlockchainService

  def initialize(blockchain = :chainpoint)
    @blockchain_klass = instantiate_blockchain_class(blockchain_name: blockchain)
  end

  def submit_to_blockchain(data:)
    return nil unless data

    @blockchain_klass&.submit_to_blockchain(data: data)
  end

  def verify_hash(hash:)
    return nil unless hash

    @blockchain_klass&.verify_hash(hash: hash)
  end

  private

  # This method intends to make it easy to connect to other blockchains
  def instantiate_blockchain_class(blockchain_name:)
    case blockchain_name
    when :chainpoint
      ChainpointBlockchainService.new
    else
      nil
    end
  end
end
