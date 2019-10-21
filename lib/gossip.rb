 require 'pry'
 require 'csv'

  class Gossip
    attr_accessor :author, :content

    def initialize(autor, content)
      @content = content
      @author = autor
    end
	
    def save
    CSV.open("./db/gossip.cvs", "ab") do |cvs|
      cvs << [@author, @content]
      end
    end

    def self.all
      all_gossips = []
      CSV.read("./db/gossip.cvs").each do |lign|
        t = Gossip.new(lign[0], lign[1])
	all_gossips << t
	end
       return all_gossips
     end
      
    
   end
