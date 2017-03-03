class PaBillreader::Bill

	attr_accessor :name, :number, :topic, :sponsor, :last_action, :full_text

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

	def create_from_array(array)
		array.each { |bill_hash|
			Bill.new(bill_hash)
		}
	end

	def add_bill_attributes(attr_hash)
		attr_hash.each { |attr, value|
			self.send("#{attr}=",value)
		}
		self
	end


end