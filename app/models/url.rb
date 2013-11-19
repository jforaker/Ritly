class Url < ActiveRecord::Base
	
	validates_presence_of :link, :message => "can't be empty"
	validates :link, length: {
	    minimum: 5,
	    maximum: 100,
	    tokenizer: lambda { |str| str.scan(//) },
	    too_short: "link must be at least %{count} letters",
	    too_long: "link should have at most %{count} letters"
	}
  	validates_format_of :link, with: /[www]./, :on => :create, :message => "is not a valid url (should include 'www')" 
  	validates_format_of :link, with: /\./, :on => :create, :message => "is not a valid url (should include '.')" 

	def self.search_for(query)
    where('hash_code = :query', query: "#{query}")
	end

  def self.get_link(query)
    if query 
      find(:all, :conditions => ['LOWER(link) = LOWER(?)',  "%#{query}%"])
    else
      find(:all)
    end
  end

end
