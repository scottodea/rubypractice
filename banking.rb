require 'colorize'
require 'multi_json'
$balance = 0


# class Login 
#   attr_accessor :user, :password
#   def initialize(username, password)
#     @username = username
#     @password = password
#   end
  def username 
    puts "What is your username?"
    $username = gets.chomp
    $username.capitalize!
    system('clear')
    end
#end




username

puts "Hey #{$username}!".colorize(:red) + 
     " Welcome ".colorize(:yellow) + 
     "to ".colorize(:green) + 
     "the ".colorize(:blue) + 
     "Rainbow ".colorize(:magenta) + 
     "Hippy ".colorize(:black) + 
     "Bank ".colorize(:light_blue)


def banking
    File.open("#{$username}-history.txt", "a+").each do |line|
    $balance = (line).to_f
    end
    puts " ----------------------------".colorize(:red)
    puts "|What would you like to do?  |".colorize(:black)
    puts "|----------------------------|".colorize(:red)
    puts "|Balance                     |".colorize(:light_blue)
    puts "|Deposit                     |".colorize(:green)
    puts "|Withdraw                    |".colorize(:yellow)
    puts "|History                     |".colorize(:magenta)
    puts " ----------------------------".colorize(:red)
    $answer = gets.chomp
    $answer.downcase!
    system('clear')
    if $answer == "balance"
    puts "Your account balance is $#{"%.2f" % $balance}"
    elsif $answer == "deposit"
    puts "Sure! How much would you like to deposit?"
    $deposit = gets.chomp
    $dep_history = []
    "%.2f" % $balance = $balance.to_f + $deposit.to_f
    $dep_history.push("$#{"%.2f" % $deposit}")
    system('clear')
    puts "Your balance is now $#{"%.2f" % $balance}"
    elsif $answer == "withdraw"
    puts "Sure! How much would you like to withdraw?: "
        $withdraw = gets.chomp
        $wit_history =[]
        if $withdraw.to_f > $balance.to_f
        puts "Insufficient Funds"
        abort
        else
        "%.2f" % $balance = $balance.to_f - $withdraw.to_f
        $wit_history.push("-$#{$withdraw}")
        system('clear')
        puts "Your balance is now $#{"%.2f" % $balance}"
        end
    elsif $answer == "history"
      $chk_history = gets.chomp
      $chk_history.downcase!
      system('clear')
      if $chk_history == "yes"
      last_10_lines = `tail -n 10 #{$username}-history.txt`
      puts last_10_lines
      end
    else
      puts "Invalid Response!"
      abort
    end

    
    if $answer == "withdraw"
        time = Time.now.strftime '%A %b %d %Y%l:%M:%S'
        File.open("#{$username}-history.txt", "a") do |line|
        line.puts "\r" "#{time}        debit  -$#{$withdraw} "
        line.puts "\r" "#{$balance}"
      end
    elsif $answer == "deposit" 
        time = Time.now.strftime '%A %b %d %Y%l:%M:%S'
        File.open("#{$username}-history.txt", "a") do |line|
        line.puts "\r" "#{time}        credit  +$#{$deposit}  "
        line.puts "\r" "#{$balance}"
      end
    end
    
    puts "Continue Banking?"
    cont = gets.chomp
    system('clear')
    if cont != "no"
      banking
    end
end


banking

  


$file = File.open("users1.txt", "a+")
hash = {$username => $balance}
$file.write MultiJson.dump(hash)