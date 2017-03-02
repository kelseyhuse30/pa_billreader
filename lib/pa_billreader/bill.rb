class PaBillreader::Bill

	attr_accessor :name, :number, :topic, :sponsor, :last_action, :full_text

	def self.all
		#scrape house and senate and return bills based on that data
		# PaBillreader::BillScraper.new("http://www.legis.state.pa.us/cfdocs/legis/bi/BillIndx.cfm?sYear=2017&sIndex=0&bod=H")
		# PaBillreader::BillScraper.new("http://www.legis.state.pa.us/cfdocs/legis/bi/BillIndx.cfm?sYear=2017&sIndex=0&bod=S")

		self.scrape_bills

	end

	def self.scrape_bills
		bills = []
		#go to senate, find bill
		#extract properties
		#instantiate a bill

		
		bills

	end

end