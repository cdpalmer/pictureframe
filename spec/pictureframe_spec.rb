require 'spec_helper'

describe Pictureframe do
  before do
    IO.any_instance.stub(:puts) # suppress puts output
  end

  describe '#frame' do
    it 'returns empty array if nil' do
      expect(Pictureframe.frame(nil)).to eq([])
    end

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

    it 'can handle non-string values' do
      hash = {a: 'b'}
      expect(Pictureframe.frame(hash)).to be_truthy
      expect(Pictureframe.frame(1)).to be_truthy
      expect(Pictureframe.frame(Object.new)).to be_truthy
      expect(Pictureframe.frame([1,2,'3'])).to be_truthy
    end
  end

  describe 'aliases' do
    before(:each) do
      @desiredOutput = [ ".___________.",
                        "| ._______. |",
                        "| |       | |",
                        "| | tests | |",
                        "| ._______. |",
                        "|___________|"]
    end

    it '#f' do
      expect(f("tests")).to eq(@desiredOutput)
    end

    it '#pf' do
      expect(pf("tests")).to eq(@desiredOutput)
    end

    it '#frame' do
      expect(frame("tests")).to eq(@desiredOutput)
    end
  end

  it 'will include a label on the frame'

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
