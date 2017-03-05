class PaBillreader::CLI

	def call
		puts "-------------------------------"
		puts "Welcome to the PA bill reader!"
		puts "-------------------------------"
		puts "Loading bills now..."
		puts "..............................."
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
		puts "-------------------------------"
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
			puts "-------------------------------"
			input = gets.downcase.strip
			if input == "view"
				input_num = get_valid_bill_num
				input_branch = get_valid_branch
				bill_to_find = PaBillreader::Bill.find_by_number(input_num, input_branch)
				display_bill_info(bill_to_find)
			elsif input == "list"
				list_bills
			elsif input == "open memo"
				open_memo(bill_to_find)
			elsif input == "open full"
				open_full(bill_to_find)
			else
				puts "Not sure what you want, type view, list or exit"
			end
		end
	end

	def get_valid_bill_num
		input_num = "0"
		while !input_num.to_i.between?(1, PaBillreader::Bill.size)
			puts "Enter the number of the bill you'd like to view"
			puts "-------------------------------"
			input_num = gets.strip
		end
		input_num
	end

	def get_valid_branch
		input_branch = ""
		while input_branch != "S" && input_branch != "H"
			puts "Would you like to see the senate or house bill?"
			puts "-------------------------------"
			input_branch = gets.strip.upcase[0,1]
		end
		input_branch
	end

	def display_bill_info(bill)
		puts "#{display_branch(bill.branch)} Bill Number #{bill.number}: #{bill.short_title}"
		puts "Primary Sponsor: #{bill.prime_sponsor}"
		puts "Last Action: #{bill.last_action}"
		puts "Type 'Open Memo' to open memo in browser." if bill.memo_url
		puts "Type 'Open Full' to open full bill text in browser." if bill.full_text_url
	end

	def open_memo(bill)
		open_in_browser(bill.memo_url)
	end

	def open_full(bill)
		open_in_browser(bill.full_text_url)
	end

	def open_in_browser(url)
		system("open '#{url}'")
	end

	def display_branch(abbrev)
		return "Senate" if abbrev == "S"
		return "House" if abbrev == "H"
	end

	def goodbye
		puts "See you later for more bills bills bills!"
	end

end