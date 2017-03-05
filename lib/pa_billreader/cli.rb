class PaBillreader::CLI

	def call
		puts "Welcome to the PA bill reader!"
		puts "Loading bills now..."
		create_bills
		create_bill_details
		puts "There are currently #{PaBillreader::Bill.size} bills."
		menu
		goodbye
	end

	def create_bills
		house_bill_array = PaBillreader::Scraper.scrape_bill_nums("H") #house bills
		senate_bill_array = PaBillreader::Scraper.scrape_bill_nums("S") #senate bills
		PaBillreader::Bill.create_from_array(house_bill_array)
		PaBillreader::Bill.create_from_array(senate_bill_array)
	end

	def create_bill_details

		PaBillreader::Bill.all.each {|bill|
			attributes = PaBillreader::Scraper.scrape_bill_detail(bill.branch, bill.number)
			bill.add_bill_attributes(attributes)
		}
	end

	def list_bills
		puts "Here are the current bills for Regular Session 2017-2018"
		PaBillreader::Bill.sorted!
		PaBillreader::Bill.all.each {|bill|
			puts bill.number
			puts bill.short_title
		}
	end

	def menu
		input = nil
		while input != "exit"
			puts "would you like to VIEW a bill, LIST all bills, or EXIT?"
			input = gets.downcase.strip
			if input == "view"
				input_num = get_valid_bill_num
				input_branch = get_valid_branch
				binding.pry
				bill_to_find = PaBillreader::Bill.find_by_number(input_num, input_branch)
				display_bill_info(bill_to_find)
			elsif input == "list"
				list_bills
			else
				puts "Not sure what you want, type view, list or exit"
			end
		end
	end

	def get_valid_bill_num
		input_num = "0"
		while !input_num.to_i.between?(1, PaBillreader::Bill.size)
			puts "Enter the number of the bill you'd like to view"
			input_num = gets.strip
		end
		input_num
	end

	def get_valid_branch
		input_branch = ""
		while input_branch != "S" && input_branch != "H"
			puts "Would you like to see the senate or house bill?"
			input_branch = gets.strip.upcase[0,1]
		end
		input_branch
	end

	def display_bill_info(bill)
		puts "Bill Number: #{bill.number}"
		puts "Branch of Congress: #{display_branch(bill.branch)}"
		puts "Short Title: #{bill.short_title}"
		puts "Primary Sponsor: #{bill.prime_sponsor}"
		puts "Last Action: #{bill.last_action}"
		puts "Memo URL: #{bill.memo_url}"
		puts "Type 'Open Memo' to open in browser."
		puts "Bill Full text URL: #{bill.full_text_url}"
		puts "Type 'Open Full' to open in browser."
	end

	def display_branch(abbrev)
		return "Senate" if abbrev == "S"
		return "House" if abbrev == "H"
	end

	def goodbye
		puts "See you later for more bills bills bills!"
	end

end