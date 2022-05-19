require_relative '../lib/BitmapEditor.rb'

describe BitmapEditor do
  describe "#process" do
    let(:bitmapEditor) { BitmapEditor.new }

    it "Should initialize with an empty canvas" do
      expect(bitmapEditor.bitmap.length).to eq(0)
    end

    it "Should create a 5 x 6 new canvas" do
      string = "I 5 6"
      bitmapEditor.process(string)
      expect(bitmapEditor.bitmap.length).to eq(5)    
    end
  end
end