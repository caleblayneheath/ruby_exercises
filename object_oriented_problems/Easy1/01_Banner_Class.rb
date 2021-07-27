class Banner
  attr_reader :message
  
  def initialize(message, banner_width = 4)
    # limits message size to 76 chars, for total 80 including borders
    @message = message[0..75]
    set_message_width(banner_width)
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def set_message_width(banner_width)
    @message_width = [banner_width - 4, message.size].max
  end

  def horizontal_rule
    "+-#{'-' * @message_width}-+"
  end

  def empty_line
    "| #{' ' * @message_width} |"
  end

  def message_line
    "| #{message.center(@message_width)} |"
  end
end

# banner = Banner.new('To boldly go where no one has gone before.')
# puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

banner = Banner.new('aba', 9)
puts banner
# +--+
# |  |
# |  |
# |  |
# +--+