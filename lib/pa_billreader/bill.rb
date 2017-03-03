class PaBillreader::Bill

	attr_accessor :number, :section, :short_title, :prime_sponsor, :last_action, :memo_url, :full_text_url

	@@all = []

	def initialize(bill_hash)
		bill_hash.each { |attr, value|
			self.send("#{attr}=", value)
		}
		save
	end

	def self.all
		@@all
	end

	def save
		@@all << self
	end

	def self.create_from_array(array)
		array.each { |bill_hash|
			self.new(bill_hash)
		}
	end

	def add_bill_attributes(attr_hash)
		attr_hash.each { |attr, value|
			self.send("#{attr}=",value)
		}
		self
	end


end