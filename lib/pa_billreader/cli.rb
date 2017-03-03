class PaBillreader::CLI

	def call
		puts "Would you like to view Senate or House bills?"
		list_bills
		menu
		goodbye
	end

	def list_bills
		puts "All the bills are here"
		PaBillreader::Scraper.scrape_bill_nums("H")
		PaBillreader::Scraper.scrape_bill_nums("S")
		@bills = PaBillreader::Bill.all
		@bills.each {|bill|
			puts "#{bill.number}. #{bill.name}"
		}
	end

	def menu
		input = nil
		while input != "exit"
			puts "Enter the number of the bill you'd like to view, or type list to see bills again, or type exit"
			input = gets.strip.downcase

			if input.to_i > 0
				the_bill = @bills
				puts @bills[input.to_i-1]
			elsif input == "list"
				list_bills
			else
				puts "Not sure what you want, type list or exit"
			end
		end
	end

	def goodbye
		puts "See you later for more bills!"
	end

end