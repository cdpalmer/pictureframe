require "pictureframe/version"

module Pictureframe
  def self.frame(text, width = 25)
    # this all should be passed into a buildFrame() function
    inputLocation = 3
    output = []
    lefts =  [".__", "| .", "| |", "| .", "|__"]
    rights = ["__.", ". |", "| |", ". |", "__|"]
    lefts.each_with_index do |row, i|
      filler =  i == 2 ? " " : "_"
      output[i] = expandLine(lefts[i], rights[i], filler, width)
    end
    output = output.insert(inputLocation, frameWrap(text, width))
    puts output.join("\n")
    return output
  end

  def self.frameWrap(text, width = 75)
    left = "| | "
    right = " | |"
    expandLine(left, right, " ", width, text)
  end

  def self.expandLine(left, right, filler, width, text = "")
    totalLength = left.length + right.length + text.length
    numFiller = width - totalLength
    left + text + filler*numFiller + right
  end
end
