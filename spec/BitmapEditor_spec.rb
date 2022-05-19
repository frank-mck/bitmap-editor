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
          string = "V 1 2 5 X"
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

    describe ".draw_horizonal_line" do
      it "Print error message if user is trying to draw a line without creating a canvas" do
        expect do
          string = "H 1 4 2 B"
          bitmapEditor.process(string)
        end.to output("Please create a canvas first\n").to_stdout
      end

      it "Draws a horizontal line" do
        expect do
          string = "I 4 4"
          bitmapEditor.process(string)

          string = "H 1 4 2 B"
          bitmapEditor.process(string)

          string = "S"
          bitmapEditor.process(string)
        end.to output("4 x 4 canvas created!\n0000\nBBBB\n0000\n0000\n").to_stdout
      end
    end

    describe ".fill_region" do
      it "Print error message if user is trying to fill region without creating a canvas" do
        expect do
          string = "F 3 4 B"
          bitmapEditor.process(string)
        end.to output("Please create a canvas first\n").to_stdout
      end

      it "fills a region on the canvas" do
        expect do
          string = "I 5 5"
          bitmapEditor.process(string)

          string = "F 3 4 B"
          bitmapEditor.process(string)
          string = "S"
          bitmapEditor.process(string)
        end.to output("5 x 5 canvas created!\nBBBB0\nBBBB0\nBBBB0\n00000\n00000\n").to_stdout
      end
    end

    describe ".clear_canvas" do
      it "Print error message if user is trying to clear canvas without creating a canvas" do
        expect do
          string = "C"
          bitmapEditor.process(string)
        end.to output("Please create a canvas first\n").to_stdout
      end

      it "Clears the canvas" do
        string = "I 4 4"
        bitmapEditor.process(string)
        string = "L 3 1 A"
        bitmapEditor.process(string)

        expect do
          string = "S"
          bitmapEditor.process(string)
        end.to output("00A0\n0000\n0000\n0000\n").to_stdout

        expect do
          string = "C"
          bitmapEditor.process(string)
          string = "S"
          bitmapEditor.process(string)
        end.to output("Canvas cleared!\n0000\n0000\n0000\n0000\n").to_stdout
      end
    end

    describe ".print_help" do
      it "prints help" do 
        expect do
          string = "?"
          bitmapEditor.process(string)
        end.to output("Commands\nI M N\nCreate a new M x N canvas with all pixels colored white (0)\n\nC\nClears the canvas, setting all pixels to white (0)\n\nL X Y C\nColors the pixel (X,Y) with color C\n\nV X X1 Y2 C\nDraw a vertical segment of color C in coloumn X between rows Y1 and Y2 (inclusive)\n\nH X1 X2 Y C\nDraw a horizontal segment of color C in row Y between columns X1 and X2 (inclusive)\n\nF X Y C\nFill the region R with color C. R is defined as pixel (X,Y)\n--------------------------------------\n").to_stdout
      end
    end
  end
end