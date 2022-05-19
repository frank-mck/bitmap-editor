require_relative '../lib/BitmapEditor.rb'

describe BitmapEditor do
  describe ".process" do
    let(:bitmapEditor) { BitmapEditor.new }

    describe ".create_canvas" do
      it "Should initialize with an empty canvas" do
        expect(bitmapEditor.bitmap.length).to eq(0)
      end

      it "Should create a 5 x 6 new canvas" do
        string = "I 5 6"
        bitmapEditor.process(string)
        expect(bitmapEditor.bitmap.length).to eq(5)    
      end
    end

    describe ".print_canvas" do
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

    describe ".color_pixel" do
      it "Print error message if user is trying to color a pixel without creating a canvas" do
        expect do
          string = "L 2 2 A"
          bitmapEditor.process(string)
        end.to output("Please create a canvas first\n").to_stdout
      end

      it "Colors a pixel" do 
        expect do
          string = "I 3 3"
          bitmapEditor.process(string)

          string = "L 3 1 A"
          bitmapEditor.process(string)

          string = "S"
          bitmapEditor.process(string)
        end.to output("3 x 3 canvas created!\n00A\n000\n000\n").to_stdout
      end
    end

    describe ".draw_vertical_line" do
      it "Print error message if user is trying to draw a line without creating a canvas" do
        expect do
          string = "V 1 2 2 X"
          bitmapEditor.process(string)
        end.to output("Please create a canvas first\n").to_stdout
      end

      it "Draws a vertical line" do
        expect do
          string = "I 5 3"
          bitmapEditor.process(string)

          string = "V 1 2 5 X"
          bitmapEditor.process(string)

          string = "S"
          bitmapEditor.process(string)
        end.to output("5 x 3 canvas created!\n000\nX00\nX00\nX00\nX00\n").to_stdout
      end
    end
  end
end