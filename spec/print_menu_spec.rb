require '../lib/print_menu'

describe print_menu do
  it "prints the menu" do
    expect(subject).to_equal "f" 
  end
end