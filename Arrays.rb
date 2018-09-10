# four_letter_animals = ["Calf","Duck","Elephant","Goat","Lamb","Lion","Mule","Dog"]
# four_letter_animals << "Puma"
# four_letter_animals.insert(4,"Joey")
# four_letter_animals.delete_at(8)
# four_letter_animals[2] = "Foal"
# four_letter_animals << "Bear"
# puts four_letter_animals

$array = []

def user_input
    puts "Enter a grocery: "
    $grocery = gets.chomp
    puts "What quantity of #{$grocery}"
    $quantity = gets.chomp
    $grq = $grocery + " x" + $quantity
    if $grocery == "Ice Cream"
        $grocery = "Brocolli"
        $array << $grq
    else
    $array << $grq
    end
end

3.times do user_input
end
puts $array.sort
