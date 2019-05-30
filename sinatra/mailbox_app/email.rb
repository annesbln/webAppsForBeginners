class Email
  def initialize(subject, headers)
    @subject = subject
    @headers = headers
  end

  def subject
    @subject
  end

  def date
    @headers[:date]
  end

  def from
    @headers[:from]
  end
end