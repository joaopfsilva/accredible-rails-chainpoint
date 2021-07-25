class Badge
  include ActiveModel::Validations

  validates_presence_of :issue_date, :recipient_name, :uuid

  attr_accessor :issue_date, :recipient_name, :uuid

  # def initialize(issue_date = nil, recipient_name = nil, uuid = nil)
  def initialize(hash_attributes)
    hash_attributes.each { |attribute, value| instance_variable_set("@#{attribute}",value) }
  end

  def digest
    Digest::SHA256.hexdigest("#{issue_date}#{recipient_name}#{uuid}")
  end
end
