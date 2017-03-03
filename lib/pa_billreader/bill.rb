class PaBillreader::Bill

	attr_accessor :name, :number, :topic, :sponsor, :last_action, :full_text
	attr_reader :all

	def initialize

	end

	def self.all
		@@all
	end

	def save
		@@all << self
	end


end