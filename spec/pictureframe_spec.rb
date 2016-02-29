require 'spec_helper'

describe Pictureframe do
  it "#frameWrap" do
    expect(Pictureframe.frameWrap("hello", 20)).to eq("| | hello        | |")
  end
end
