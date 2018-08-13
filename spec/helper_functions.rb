def output_as_array_without_spaces
  $stdout.rewind
  output = $stdout.readlines
  output.map { |line| line.strip.delete(' ') }
end