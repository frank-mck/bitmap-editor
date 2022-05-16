require_relative 'help'

@bitmap
@canvasX
@canvasY
MAX_PIXELS = 250
MIN_PIXELS = 1

def print_menu 
  puts "S: Show the contents of the current canvas"
  puts "X: Terminate the session"
  puts "?: Shows in program help"
end

def interactive_menu
  print_menu
  loop do    
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "S" then print_canvas
  when "?" then print_help
  when /^I\s\d+\s\d+$/
    create_canvas(selection)
  when /^L\s\d+\s\d+\s[A-Z]{1}$/
    color_pixels(selection)
  when "C" then clear_canvas
  when "X" then exit
  end
end

def print_canvas
  @bitmap.each { |row| puts row.join.center(100) }
end

def create_canvas(selection)
  coord = selection.scan(/[0-9]+/).map(&:to_i)
  puts "#{coord}"
  @canvasX = coord[0]
  @canvasY = coord[1]

  if @canvasX > MAX_PIXELS || @canvasY > MAX_PIXELS || 
     @canvasX < MIN_PIXELS || @canvasY < MIN_PIXELS
    puts "A canvas can only be between 1 and 250 pixels large"
    return
  end

  @bitmap = Array.new(@canvasX) { Array.new(@canvasY, 0) }
end

def color_pixels(selection)
  if !@bitmap
    puts "Please create a canvas first"
    return
  end
  color = selection[selection.length - 1]
  coord = selection.scan(/[0-9]+/).map(&:to_i)
  x = coord[0] - 1
  y = coord[1] - 1

  row = @bitmap[y]
  row[x] = color
end

def clear_canvas 
  @bitmap = Array.new(@canvasX) { Array.new(@canvasY, 0) }
end

interactive_menu