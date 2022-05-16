def print_help
  puts "Commands".center(100)
  puts"I M N"
  puts "Create a new M x N canvas with all pixels colored white (0)"
  puts ""
  puts "C"
  puts "Clears the canvas, setting all pixels to white (0)"
  puts ""
  puts "L X Y C"
  puts "Colors the pixel (X,Y) with color C"
  puts ""
  puts "V X X1 Y2 C"
  puts "Draw a vertical segment of color C in coloumn X between rows Y1 and Y2 (inclusive)"
  puts ""
  puts "H X1 X2 Y C"
  puts "Draw a horizontal segment of color C in row Y between columns X1 and X2 (inclusive)"
  puts ""
  puts "F X Y C"
  puts "Fill the region R with color C. R is defined as pixel (X,Y)"
  puts "--------------------------------------".center(100)
end