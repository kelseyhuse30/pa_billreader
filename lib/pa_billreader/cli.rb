class PaBillreader::CLI

	def call
		puts "Welcome to the PA bill reader!"
		create_bills
		create_bill_details
		puts "There are currently #{PaBillreader::Bill.all.size} bills."
		list_bill_nums
		menu
		goodbye
	end

	def create_bills
		bill_array = PaBillreader::Scraper.scrape_bill_nums("H") #house bills
		bill_array << PaBillreader::Scraper.scrape_bill_nums("S") #senate bills
		bill_array.sort
		PaBillreader::Bill.create_from_array(bill_array)
	end

	def create_bill_details
		PaBillreader::Bill.all.each {|bill|
			attributes = PaBillreader::Scraper.scrape_bill_detail(bill.section, bill.number)
			bill.add_bill_attributes(attributes)
		}
	end

	def list_bills
		puts "All the bills are here"
		PaBillreader::Scraper.scrape_bill_detail("S","3")

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