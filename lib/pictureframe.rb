require "pictureframe/version"

module Pictureframe
  def self.frame(text, width = 5)
    inputLocation = 3
    output = []
    lefts =  [".___", "| ._", "| | ", "| ._", "|___"]
    rights = ["___.", "_. |", " | |", "_. |", "___|"]
    totalLength = lefts[0].length + rights[0].length + text.length
    width = totalLength if totalLength > width
    lefts.each_with_index do |row, i|
      filler =  i == 2 ? " " : "_"
      output[i] = expandLine(lefts[i], rights[i], filler, width)
    end
    output = output.insert(inputLocation, expandLine("| | ", " | |", " ", width, text))
    puts output.join("\n")
    return output
  end

  def self.expandLine(left, right, filler, width, text = "")
    totalLength = left.length + right.length + text.length
    width = totalLength if totalLength > width
    numFiller = width - totalLength
    left + text + filler*numFiller + right
  end
end
