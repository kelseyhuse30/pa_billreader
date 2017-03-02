class PaBillreader::CLI

	def call
		puts "Would you like to view Senate or House bills?"
		list_bills
		menu
		goodbye
	end

	def list_bills
		puts <<-DOC.gsub /^\s*/, ''
		13. An Act amending Title 18 (Crimes and Offenses) of the Pennsylvania Consolidated Statutes, in riot, disorderly conduct and related offenses, further providing for the offense of cruelty to animals.
		14. An Act amending Title 24 (Education) of the Pennsylvania Consolidated Statutes, providing for the role of institutions of higher education in immigration enforcement, for restrictions on immigration policies and for duties of the Department of Education.
	DOC
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