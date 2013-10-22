class Url < ActiveRecord::Base
	
	validates_presence_of :link, :message => "can't be empty"
	validates :link, length: {
	    minimum: 5,
	    maximum: 100,
	    tokenizer: lambda { |str| str.scan(//) },
	    too_short: "link must be at least %{count} letters",
	    too_long: "link must have at most %{count} letters"
	}

  	validates_format_of :link, with: /[www]./, :on => :create, :message => "is not a valid url (should include 'www')" 
  	validates_format_of :link, with: /./, :on => :create, :message => "is not a valid url (should include 'www')" 

	def self.search_for(query)
		where('hash_code LIKE :query', query: "%#{query}%")
	end

	def self.get_link(query)
		where('link LIKE :query', query: "%#{query}%")
	end
end
