class OrangeTree
    def initialize
        @height = 0
        @age = 0
        if @height == 0 and @age == 0
            treeage
            treeheight
        end
    end
    def treeage
        puts "How old is your orange tree"
        @age = gets.chomp.to_i
        # puts "Your orange tree is #{@age} years old"
    end
    def treeheight
        puts "How tall is your orange tree"
        @height = gets.chomp.to_i
        # puts "Your orange tree is #{@height}m tall"
    end
    def oneyearpasses
        puts "Summmer.....Autumn....Winter....Spring...."
        @age += 1
        @height += 2
        puts "Your tree aged a year, it's now #{@age} years old and #{@height}m tall"
        fruit
        if @age >= 50
            puts "I'm sorry, your orange tree has died"
            exit
        end
    end
    def fruit
        @fruit = 0
        if @age <= 3
            @fruit = 0
        elsif @age <= 10
            @fruit = 35
        elsif @age <= 30
            @fruit = 70
        else
            @fruit = 120
        end
    end
    def countoranges
        puts "I've got #{@fruit} oranges"
    end
    def pickanorange
        if @fruit <= 0 
            puts "But there's nothing to pick?"
        else
        @fruit -= 1
        puts "*These oranges look delicious, you can't resist eating one*"
        puts "Yum..Delicious..*The citrus flavor excites your mouth"
        end
    end
end

my_tree = OrangeTree.new
i = 0
until i > 20
my_tree.oneyearpasses
my_tree.pickanorange
my_tree.countoranges
i += 1
end
