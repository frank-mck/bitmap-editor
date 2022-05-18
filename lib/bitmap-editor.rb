require_relative 'help'

class BitmapEditor
  MAX_PIXELS = 250
  MIN_PIXELS = 1

  def initialize
    @bitmap
    @canvasX
    @canvasY 
  end

  def print_menu 
    puts "I M N: Create a new M x N canvas with all pixels colored white (0)"
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
      color_pixel(selection)
    when /^V\s\d+\s\d+\s\d+\s[A-Z]{1}$/ 
      draw_vertical_line(selection)
    when /^H\s\d+\s\d+\s\d+\s[A-Z]{1}$/
      draw_horizonal_line(selection)
    when "C" then clear_canvas
    when "X" then exit
    end
  end
  
  def print_canvas
    if !@bitmap
      puts "Please create a canvas first"
      return
    end
    @bitmap.each { |row| puts row.join.center(100) }
  end
  
  def create_canvas(selection)
    coord = selection.scan(/[0-9]+/).map(&:to_i)
    @canvasX = coord[0]
    @canvasY = coord[1]
  
    if @canvasX > MAX_PIXELS || @canvasY > MAX_PIXELS || 
       @canvasX < MIN_PIXELS || @canvasY < MIN_PIXELS
      puts "A canvas can only be between 1 and 250 pixels large"
      return
    end
  
    @bitmap = Array.new(@canvasX) { Array.new(@canvasY, 0) }
    puts "#{@canvasX} x #{@canvasY} canvas created!"
  end
  
  def color_pixel(selection)
    if !@bitmap
      puts "Please create a canvas first"
      return
    end
    coord = get_coords(selection)
    color = selection[selection.length - 1]
    x = coord[0] - 1
    y = coord[1] - 1
  
    row = @bitmap[y]
    row[x] = color
  end
  
  def draw_vertical_line(selection)
    if !@bitmap
      puts "Please create a canvas first"
      return
    end
    coord = get_coords(selection)
    color = selection[selection.length - 1]
    column = coord[0] - 1
    x = coord[1] - 1
    y = coord[2] - 1
    
    i = x
    ((y - x) + 1).times do
      @bitmap[x][column] = color
      x += 1
    end
  end

  def draw_horizonal_line(selection)
    coord = get_coords(selection)
    color = selection[selection.length - 1]
    row = coord[2] - 1
    x = coord[0] - 1
    y = coord[1] - 1

    i = x
    ((y - x) + 1).times do
      @bitmap[row][x] = color
      x += 1
    end
  end
  
  def get_coords(selection)
    return selection.scan(/[0-9]+/).map(&:to_i)
  end
  
  def clear_canvas 
    @bitmap = Array.new(@canvasX) { Array.new(@canvasY, 0) }
    puts "Canvas cleared!"
  end
end

bitmap = BitmapEditor.new

bitmap.interactive_menu