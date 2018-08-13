def capture_stdout
  old_stdout = $stdout
  $stdout = StringIO.new
  yield
  $stdout.rewind
  output = $stdout.readlines
  $stdout = old_stdout
  output.map(&:strip)
end