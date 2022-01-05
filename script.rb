
#  ---------------------------------------------------------------  PRACTICE 03. BOOK STORE.  ------------------------------------------------------------
=begin

    Description: 
        In this project the user can storage books and buy books.
        The user will defined if is a seller or a buyer.
        The seller can upload information related to the product, 
        such as price, title, author, pages and editorial.
        The buyer will introduce its name and the amount of 
        money it has. The boyer will be able to buy the books 
        that are in storage and if the money is enough.

    Instructions used:
        - Variables.
        - Arrays
        - If-Else Statements.
        - Classes.
        - Methods.
        - While loops.
        - For loops.

    Author:
        - Jorge Ortiz Mata.
        - San Luis Potosí S.L.P. México
        - ortiz.mata.jorge@gmail.com
        - +52 (444) 576 3034.
=end

# ------------------------------------------------ START -------------------------------------------------

book_info_array = Array.new
books_array = Array.new
books_stock = 0

# Step 00. Welcome Message.

puts "\n"
puts "Hello user. You are in Books' World." 
puts "It's a book store where you can buy or sell any book."

# Step 01. Set Book Method.

class Book 
    attr_accessor :title, :price, :author, :pages, :editorial
    def initialize(book_title, book_price, book_author, book_pages)
        @title = book_title
        @price = book_price
        @author = book_author
        @pages = book_pages
    end
end

# Step 02. Ask the user what he's going to do.

value_menu = 0

while value_menu != 4

    puts "\n"
    puts "Please, tell me, are you gonna sell a book or buy a new one?"
    puts "\n"
    puts "(1) Buy a book."
    puts "(2) Sell a book."
    puts "(3) Show list books."
    puts "(4) Leave."
    print "Option: "
    user_option = Integer(gets.chomp)

# ------------------- Step 03. Case for each option. ------------------

    case user_option

# ------------------- Step 04. If the user is a buyer. ------------------

        when user_option = 1
            if books_stock > 0
                puts "\n"
                puts "You've chosen to buy a book."
                puts "The books in stock is: #{books_stock}"
                puts "\n"
                puts "\nAnd these are the available books that we have in stock:\n"

                for i in 1..books_stock
                    puts "#{i}. TITLE: #{books_array[i].title}, PRICE: #{books_array[i].price}, AUTHOR: #{books_array[i].author}, PAGES: #{books_array[i].pages}."
                end
                puts "\n"
                print "How much money do you have? "
                money_user = (gets.chomp).to_f
                print "Which book do you want to buy? "
                user_option_buy = Integer(gets.chomp)
                if user_option_buy > 0 && user_option_buy <= books_stock
                    puts "\n"
                    puts "You've chosen: "
                    puts "Book: #{user_option_buy}. TITLE: #{books_array[user_option_buy].title}, PRICE: #{books_array[user_option_buy].price}, AUTHOR: #{books_array[user_option_buy].author}, PAGES: #{books_array[user_option_buy].pages}."
                        if books_array[user_option_buy].price <= money_user
                            puts "\n"
                            puts "It seems that you have enough money."
                            print "Do you want to buy the book? (1)Yes. (2)No. R:"
                            puts "\n"
                            choice_user = Integer(gets.chomp)
                            if choice_user == 1
                                money_user = money_user - books_array[user_option_buy].price
                                puts "\n"
                                puts "Purchase: BOOK: #{user_option_buy}. TITLE: #{books_array[user_option_buy].title}, PRICE: #{books_array[user_option_buy].price}, AUTHOR: #{books_array[user_option_buy].author}, PAGES: #{books_array[user_option_buy].pages}."
                                puts "Great! You've done the purchase. We call you up few minutes later to get information about the deliver."
                                puts "Now, in your bank account you have: #{money_user}"
                                books_array.delete_at(user_option_buy)
                                books_stock = books_stock - 1
                                puts "\n"
                            elsif choice_user == 2
                                puts "Oh, well, there's more books in our stock. Feel free to see."
                                puts "\n"
                            end
                        else
                            puts "Sorry dear user, but you don't have enough money. Come back later."
                            puts "\n"
                        end
                elsif
                    puts "\nSorry, you typed a wrong option. Try again later."
                end
                puts "\n"
            elsif books_stock == 0
                puts "\n"
                puts "Sorry but, there isn't any book in stock. Come back later."
                puts "\n"
            end
            puts "\n"

# ------------------- Step 05. If the user is a seller. ------------------
        
        when user_option = 2
            puts "\n"
            puts "You've chosen to sell a book."
            puts "\n"
            print "Please, how many books are you going to sell? "
            quantity_books = Integer(gets.chomp)

            if books_stock == 0
                books_stock = quantity_books
                puts "\n"
                puts "Please, introduce some book's features such as title, price, author and pages."
                puts "\n"
                
                for i in 1..books_stock
                    print "- #{i}. Book's title: "
                    book_info_array[0] = (gets.chomp).to_s
                    print "- #{i}. Book's price: "
                    book_info_array[1] = (gets.chomp).to_f
                    print "- #{i}. Book's author: "
                    book_info_array[2] = (gets.chomp).to_s
                    print "- #{i}. Book's pages: "
                    book_info_array[3] = Integer(gets.chomp)
                    
                    books_array[i] = Book.new(book_info_array[0], book_info_array[1], book_info_array[2], book_info_array[3])
                    print "\n"
                end
            elsif books_stock > 0
                new_books_stock = books_stock + 1
                books_stock = books_stock + quantity_books
                puts "\n"
                puts "Please, introduce some book's features such as title, price, author and pages."
                puts "\n"

                for i in new_books_stock..books_stock
                    puts "\n"
                    print "- #{i}. Book's title: "
                    book_info_array[0] = (gets.chomp).to_s
                    print "- #{i}. Book's price: "
                    book_info_array[1] = (gets.chomp).to_f
                    print "- #{i}. Book's author: "
                    book_info_array[2] = (gets.chomp).to_s
                    print "- #{i}. Book's pages: "
                    book_info_array[3] = Integer(gets.chomp)

                    books_array[i] = Book.new(book_info_array[0], book_info_array[1], book_info_array[2], book_info_array[3])
                    print "\n"
                end
            end
            puts "\n"

# ------------------- Step 06. If the user wants to see the available books. ------------------

        when user_option = 3
            puts "\n"
            puts "You've decided to see the books' list"
            if books_stock == 0
                puts "Sorry, there is not any book available. Come back later!\n"
            elsif books_stock > 0
                puts "\n"
                puts "These are the available books that we have in stock:"
                puts "\n"
                puts "The books in stock is: #{books_stock}"
                puts "\n"
                for i in 1..books_stock
                    puts "#{i}. TITLE: #{books_array[i].title}, PRICE: #{books_array[i].price}, AUTHOR: #{books_array[i].author}, PAGES: #{books_array[i].pages}."
                end
            end
            puts "\n"

# ------------------- Step 07. If the user wants to leave. ------------------
                
        when user_option = 4
            puts "\n"
            puts "You've decided to leave."
            puts "We hope you see you again soon."
            puts "Have an amazing day!!!"
            value_menu = 4
            puts "\n"

# ------------------- Step 08. If the user type a different menu's value. ------------------

        else
            puts "\n"
            puts "It seems that you chose a different menu's option."
            puts "Please, try again."
            puts "\n"

    end 
end

# ------------------------------------------------- END --------------------------------------------------