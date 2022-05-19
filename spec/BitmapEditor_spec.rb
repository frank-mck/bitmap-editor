require_relative '../lib/BitmapEditor.rb'

describe BitmapEditor do
  describe "#process" do
    let(:bitmapEditor) { BitmapEditor.new }

    context "#create_canvas" do
      it "Should initialize with an empty canvas" do
        expect(bitmapEditor.bitmap.length).to eq(0)
      end

      it "Should create a 5 x 6 new canvas" do
        string = "I 5 6"
        bitmapEditor.process(string)
        expect(bitmapEditor.bitmap.length).to eq(5)    
      end
    end

    context "#print_canvas" do
      it "Print error message if user is trying to view canvas without creating one" do
        expect do
          string = "S"
          bitmapEditor.process(string)
        end.to output("Please create a canvas first\n").to_stdout
      end

      it "Prints the canvas" do
        expect do
          string = "I 1 1"
          bitmapEditor.process(string)
         
          string = "S"
          bitmapEditor.process(string)
        end.to output("1 x 1 canvas created!\n0\n").to_stdout
      end
    end
  end
end