class WordReader
  def read_from_file(file_name)
    if File.exist?(file_name)
      f = File.new(file_name)
      lines = f.readlines
      f.close
      lines.sample.chomp
    else
      nil
    end
  end
end
