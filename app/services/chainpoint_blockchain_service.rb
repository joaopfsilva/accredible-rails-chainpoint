# based on https://github.com/chainpoint/chainpoint-gateway/wiki/Gateway-HTTP-API#submitting-hashes
class ChainpointBlockchainService
  include HTTParty
  require 'digest'

  base_uri "http://3.136.178.15"

  def initialize; end

  def submit_to_blockchain(data:)
    self.class.post("/hashes", { hashes: digest_data(data) })
  end

  def verify_hash(hash:)
    self.class.get("/proofs/#{hash}")
  end

  private

  def digest_data(data)
    issue_date = data["issue_date"]
    recipient_name = data["recipient_name"]
    uuid = data["uuid"]

    Digest::SHA256.hexdigest("#{issue_date}#{recipient_name}#{uuid}")
  end
end
