class NameValidator
  def initialize(name, names)
    @name = name
    @names = names
  end

  def valid?
    validate
    @message.nil?
  end

  def message
    @message
  end

  private

  def validate
    if @name.empty?
      @message = "Please enter a name."
    elsif @names.include?(@name)
      @message = "#{@name} is already in the list. Please choose another name."
    end
  end
end
