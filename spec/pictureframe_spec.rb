require 'spec_helper'

describe Pictureframe do
  it '#frame' do
    desiredOutput = [ ".___________.",
                      "| ._______. |",
                      "| |       | |",
                      "| | test  | |",
                      "| ._______. |",
                      "|___________|"]
    expect(Pictureframe.frame("test", 13)).to eq(desiredOutput)
  end

  describe '#expandLine' do
    it 'will expand to width' do
      left = "left"
      right = "right"
      width = 20
      filler = " "
      expected = "left           right"
      expect(Pictureframe.expandLine(left, right, filler, width)).to eq(expected)
    end

    it 'will adjust width if too small' do
      expect(Pictureframe.expandLine("| | ", " | |", " ", 2, "hello")).to eq("| | hello | |")
    end
  end
end
