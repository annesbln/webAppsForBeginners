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

  def exchange(name, new_name)
    names = read_names
    index = names.index(name)
    names[index] = new_name

    File.write(@filename, names.join("\n"))
  end
end