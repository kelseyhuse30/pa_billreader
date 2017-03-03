class PaBillreader::Scraper

	attr_accessor :bills

	def self.scrape_bill_nums(section)
		doc = Nokogiri::HTML(open("http://www.legis.state.pa.us/cfdocs/legis/bi/BillIndx.cfm?sYear=2017&sIndex=0&bod=#{section}"))
		@bills = []

		doc.css("table.DataTable")[0].children.css("a").text.each { |item|

			@bills << {number: item, section: section}
		}
	end

	def self.scrape_bill_detail(section, bill)

		doc = Nokogiri::HTML(open("http://www.legis.state.pa.us/cfdocs/billinfo/billinfo.cfm?syear=2017&sind=0&body=#{section}&type=B&bn=#{bill}"))

		binding.pry
		short_title = doc.css("div.BillInfo-ShortTitle div").text
		prime_sponsor = doc.css("div.BillInfo-Section-Data div").text
		last_action = doc.css("div.BillInfo-Section-Data div").text
		memo_url = doc.css("div.BillInfo-Section-Data div").text
		full_text_url = doc.css("div.BillInfo-Section-Data div").text


	end

end