require "csv"

class EmailsCsvStore
  def initialize(filename)
    @filename = filename
  end

  def read
    rows = CSV.read(@filename)  # each line is an array of three strings
    emails(rows)
  end

  def emails(rows)
    rows.shift                  #kicks out the first line as its the header
    rows.map {|row| Email.new(row[2], { date: row[0], from: row[1] })}
  end
end