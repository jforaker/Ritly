class Url < ActiveRecord::Base
	def self.search_for(query)
		where('hash_code LIKE :query', query: "%#{query}%")
	end

	def self.get_link(query)
		where('link LIKE :query', query: "%#{query}%")
	end
end
