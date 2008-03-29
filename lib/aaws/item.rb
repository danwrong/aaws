module AAWS
  class Item < Base
    @default_params.update :operation => 'ItemSearch'
    
    def self.search(options={})
      get(options)
    end
  end
end