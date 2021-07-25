# based on https://github.com/chainpoint/chainpoint-gateway/wiki/Gateway-HTTP-API#submitting-hashes
class ChainpointBlockchainService
  include HTTParty

  base_uri "http://3.136.178.15"

  def initialize; end

  def submit_to_blockchain(data:)
    @badge = Badge.new(data)
    self.class.post(
      "/hashes",
      body: { hashes: [@badge.digest] }.to_json,
      headers: {
        'Content-Type' => 'application/json',
        'Accept' => 'application/json'
      }
    )
  end

  def verify_hash(hash:)
    self.class.get("/proofs/#{hash}")
  end
end
