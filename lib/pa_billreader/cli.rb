class PaBillreader::CLI

	def call
		puts "Would you like to view Senate or House bills?"
		list_bills
	end

	def list_bills
		puts <<-DOC.gsub /^\s*/, ''
		13. An Act amending Title 18 (Crimes and Offenses) of the Pennsylvania Consolidated Statutes, in riot, disorderly conduct and related offenses, further providing for the offense of cruelty to animals.
		14. An Act amending Title 24 (Education) of the Pennsylvania Consolidated Statutes, providing for the role of institutions of higher education in immigration enforcement, for restrictions on immigration policies and for duties of the Department of Education.
	DOC
	end

end