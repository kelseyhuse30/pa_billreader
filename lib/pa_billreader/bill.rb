class PaBillreader::Bill

	attr_accessor :name, :topic, :sponsor, :last_action

	def self.all
		#should return all bills
		puts <<-DOC.gsub /^\s*/, ''

		
	DOC
	bill_13 = self.new
	bill_13.name = "An Act amending Title 18 (Crimes and Offenses) of the Pennsylvania Consolidated Statutes, in riot, disorderly conduct and related offenses, further providing for the offense of cruelty to animals."
	bill_13.topic = "crime"
	bill_13.sponsor = "rep bizzarro"
	bill_13.last_action = "referred to judiciary, Jan. 23 2017 [House]"
	bill_13.full_text = "http://www.legis.state.pa.us/CFDOCS/Legis/PN/Public/btCheck.cfm?txtType=HTM&sessYr=2017&sessInd=0&billBody=H&billTyp=B&billNbr=0013&pn=0031"

	bill_14 = self.new
	bill_14.name = "14. An Act amending Title 24 (Education) of the Pennsylvania Consolidated Statutes, providing for the role of institutions of higher education in immigration enforcement, for restrictions on immigration policies and for duties of the Department of Education."
	bill_14.topic = "education"
	bill_14.sponsor = "Representative KNOWLES"
	bill_14.last_action = "Referred to STATE GOVERNMENt, Jan. 23, 2017 [House]"
	bill_14.full_text = "http://www.legis.state.pa.us/CFDOCS/Legis/PN/Public/btCheck.cfm?txtType=HTM&sessYr=2017&sessInd=0&billBody=H&billTyp=B&billNbr=0014&pn=0032"
	
	[bill_13, bill_14]
	end

end