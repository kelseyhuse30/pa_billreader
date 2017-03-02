class PaBillreader::CLI

	def call
		puts "Would you like to view Senate or House bills?"
		list_bills
		menu
		goodbye
	end

	def list_bills
		@bills = PaBillreader::Bill.all
	end

	def menu
		input = nil
		while input != "exit"
			puts "Enter the number of the bill you'd like to view, or type list to see bills again, or type exit"
			input = gets.strip.downcase
			case input
			when "13"
				puts "more info on bill 13..."
			when "14"
				puts "more info on bill 14..."
			when "list"
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