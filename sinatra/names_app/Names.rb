class Names
  def initialize(filename)
    @filename = filename
  end

  def store_name(string)
    File.open(@filename, "a+") do |file|
      file.puts(string)
    end
  end

  def read_names
    return [] unless File.exists?(@filename)
    File.read(@filename).split("\n")
  end
end