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

