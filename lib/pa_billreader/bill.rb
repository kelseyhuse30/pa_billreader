class PaBillreader::Bill

	attr_accessor :name, :number, :topic, :sponsor, :last_action, :full_text

	def self.all

		self.scrape_bills

	end

	def self.scrape_bills
		bills = []
		#go to senate, find bill
		#extract properties
		#instantiate a bill
		bills << self.scrape_senate
		bills << self.scrape_house
		
		bills

	end

	def self.scrape_house
		doc = Nokogiri::HTML(open("http://www.legis.state.pa.us/cfdocs/legis/bi/BillIndx.cfm?sYear=2017&sIndex=0&bod=H"))
		number = doc.css()
		bill = self.new
		bill.number = number
	end

	def self.scrape_senate
		doc = Nokogiri::HTML(open("http://www.legis.state.pa.us/cfdocs/legis/bi/BillIndx.cfm?sYear=2017&sIndex=0&bod=S"))
	end
end