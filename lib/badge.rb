class Badge
  attr_accessor :issue_date, :recipient_name, :uuid

  def initialize(issue_date, recipient_name, uuid)
    @issue_date = issue_date
    @recipient_name = recipient_name
    @uuid = uuid
  end
end
