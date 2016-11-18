require "pictureframe/version"

def f(text, width = nil)
  Pictureframe.frame(text, width)
end
alias frame f
alias pf f

module Pictureframe
  def self.frame(text, width = nil)
    if text.nil?
      return []
    else
      text = text.to_s
    end

    inputLocation = 3
    output = []
    lefts =  [".___", "| ._", "| | ", "| ._", "|___"]
    rights = ["___.", "_. |", " | |", "_. |", "___|"]
    insideLines = [text]

    if width
      textSpace = width - (lefts[0].length * 2)
      insideLines = textSpace < text.length ? breakText(text, textSpace) : [text]
    else
      totalLength = lefts[0].length + rights[0].length + text.length
      width = totalLength
    end

    lefts.each_with_index do |row, i|
      filler =  i == 2 ? " " : "_"
      output[i] = expandLine(lefts[i], rights[i], filler, width)
    end

    insideLines.reverse.each do |text|
      output = output.insert(inputLocation, expandLine("| | ", " | |", " ", width, text))
    end

    puts output.join("\n")
    return output
  end

  def self.breakText(string, numChars)
    string.scan(/#{'.{1,' + numChars.to_s}}/)
  end

  def self.expandLine(left, right, filler, width, text = "")
    totalLength = left.length + right.length + text.length
    width = totalLength if totalLength > width
    numFiller = width - totalLength
    left + text + filler*numFiller + right
  end
end
