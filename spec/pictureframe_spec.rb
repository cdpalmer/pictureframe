require 'spec_helper'

describe Pictureframe do
  describe '#frame' do
    it 'will expand to width of text' do
      desiredOutput = [ ".___________.",
                        "| ._______. |",
                        "| |       | |",
                        "| | tests | |",
                        "| ._______. |",
                        "|___________|"]
      expect(Pictureframe.frame("tests")).to eq(desiredOutput)
    end

    it 'will expand frame to desired width' do
      desiredOutput = [ ".___________.",
                        "| ._______. |",
                        "| |       | |",
                        "| | test  | |",
                        "| ._______. |",
                        "|___________|"]
      expect(Pictureframe.frame("test", 13)).to eq(desiredOutput)
    end

    it 'will break string to desired width' do
      desiredOutput = [ ".___________.",
                        "| ._______. |",
                        "| |       | |",
                        "| | the q | |",
                        "| | uick  | |",
                        "| | brown | |",
                        "| |  fox  | |",
                        "| ._______. |",
                        "|___________|"]
      expect(Pictureframe.frame("the quick brown fox", 13)).to eq(desiredOutput)
    end
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
