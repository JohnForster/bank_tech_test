def capture_stdout
  output = []
  use_temporary_stdout_for do
    yield
    $stdout.rewind
    output = $stdout.readlines
  end
  output.map(&:strip)
end

def use_temporary_stdout_for
  old_stdout = $stdout
  $stdout = StringIO.new
  yield
  $stdout = old_stdout
end