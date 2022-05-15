@bitmap = Array.new(6) { Array.new(5, 0) }

def print_menu 
  puts "S: Show the contents of the current canvas"
  puts "X: Terminate the session"
  puts "?: Shows in program help"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "S" then print_canvas
  end
end

def print_canvas
  @bitmap.each { |row| puts row.join.center(100) }
end

interactive_menu