class EbookConverter
  def self.convert(input, output)
    return output if system("ebook-convert \"#{input}\" \"#{output}\"")
    false
  end
end

