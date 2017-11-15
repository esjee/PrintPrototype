module PrintPrototype
  prepend_features ArgumentError

  def to_s
    msg = super.dup

    method_we_tried_to_call = backtrace[0]
    parsed_line = Raven::Backtrace::Line.parse(method_we_tried_to_call)

    line_with_function_def = if File.exists?(parsed_line.file)
      complete_file = File.readlines(parsed_line.file)
      line_with_function_def = complete_file[parsed_line.number - 1]
      line_with_function_def.strip!
    end

    if line_with_function_def && line_with_function_def.start_with?("def")
      msg << "\nMethod prototype:\n\t#{line_with_function_def}\n"
    end

    msg
  rescue => _e
    super
  end
end
