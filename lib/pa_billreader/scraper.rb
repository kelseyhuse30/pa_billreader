class PaBillreader::Scraper

	attr_accessor :bills

	def self.scrape_bill_nums(branch)
		doc = Nokogiri::HTML(open("http://www.legis.state.pa.us/cfdocs/legis/bi/BillIndx.cfm?sYear=2017&sIndex=0&bod=#{branch}"))
		@bills = []

		doc.css("table.DataTable")[0].css("td a").each { |id|
			@bills << {number: id.text, branch: branch}
		}

		@bills
	end

	def self.scrape_bill_detail(branch, bill)

		doc = Nokogiri::HTML(open("http://www.legis.state.pa.us/cfdocs/billinfo/billinfo.cfm?syear=2017&sind=0&body=#{branch}&type=B&bn=#{bill}"))
		bill_details = {}
		
		bill_details[:short_title] = doc.css("div.BillInfo-ShortTitle div.BillInfo-Section-Data").text.strip
		bill_details[:prime_sponsor] = doc.css("div.BillInfo-PrimeSponsor div.BillInfo-Section-Data").text.strip
		bill_details[:last_action] = doc.css("div.BillInfo-LastAction div.BillInfo-Section-Data").text.strip
		bill_details[:memo_url] = doc.css("div.BillInfo-CosponMemo div.BillInfo-Section-Data a").attr('href').value if doc.at_css("div.BillInfo-CosponMemo div.BillInfo-Section-Data a")
		bill_details[:full_text_url] = "http://www.legis.state.pa.us#{doc.css("table.DataTable.BillInfo-PNTable td[valign='middle'] a").attr('href').value}" if doc.at_css("table.DataTable.BillInfo-PNTable td[valign='middle'] a")

		bill_details

	end

end