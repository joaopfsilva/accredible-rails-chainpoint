# based on https://github.com/chainpoint/chainpoint-gateway/wiki/Gateway-HTTP-API#submitting-hashes
class ChainpointBlockchainService
  include HTTParty
  require 'digest'

  base_uri = "http://3.136.178.15"

  def initialize; end

  def self.submit_to_blockchain(data)
    self.class.post("/hashes", { hashes: digest(data) })
  end

  def self.verify_hash(proof_id)
    self.class.get("/proofs/#{proof_id}")
  end

  private

  def self.digest(data)
    Digest::SHA256.hexdigest(data)
  end
end
