class ErrorSerializer
  def self.format_error(error_message)
    # require 'pry'; binding.pry
    {
      message: error_message.message,
      status: 404
    }
  end
end
