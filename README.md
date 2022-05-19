# bitmap-editor

## Exercise

Produce a Ruby program that simulates a basic canvas editor.
A canvas is represented as an M x N matrix of pixels with each element representing a colour.
The goal of your program is to read instructions from the command line and to fill the canvas with a sequence of
adjacent letters according to the command received


## Commands
- I M N:
Create a new M x N canvas with all pixels coloured white (O).
- C:
Clears the canvas, setting all pixels to white (O).
- L X Y C:
Colours the pixel (X,Y) with colour C.
- V X Y1 Y2 C:
Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
- H X1 X2 Y C:
Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
- F X Y C:
Fill the region R with the colour C. R is defined as: Pixel (X,Y) belongs to R.

## How to use

```
git clone https://github.com/frank-mck/bitmap-editor.git
cd bitmap-editor
ruby ./lib/BitmapEditor.rb
```

Run tests

``` 
gem install rspec
rspec
```

Have fun!! :)
