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

  it "#frameWrap" do
    expect(Pictureframe.frameWrap("hello", 20)).to eq("| | hello        | |")
  end

  it '#expandLine' do
    left = "left"
    right = "right"
    width = 20
    filler = " "
    expected = "left           right"
    expect(Pictureframe.expandLine(left, right, filler, width)).to eq(expected)
  end
end
