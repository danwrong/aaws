module AAWS
  class SearchResults < OpenStruct; end
  
  class Item < Base
    @default_params.update :operation => 'ItemSearch'
    
    # just do an AAWS::Item.search(:title => 'ruby on rails').inspect to see the methods
    def self.search(options={})
      doc = parse(get(options))
      items = (doc/'Item').inject([]) { |collection, item| collection << new_from_element(item) }
      SearchResults.new(:items => items)
    end
    
    def self.new_from_element(element)
      obj = OpenStruct.new
      obj.asin = element.at('ASIN').innerHTML
      obj.url = element.at('DetailPageURL').innerHTML
      
      # auto create methods for each of the item attributes
      element.at('ItemAttributes').children.each do |child|
        if child.respond_to?(:stag)
          attr = child.stag.name.underscore
          obj.send("#{attr}=", child.innerHTML) unless %w[asin url].include?(attr)
        end        
      end
      obj
    end
  end
end