module AAWS
  class Book < Item
    @default_params.update :search_index => 'Books'
  end
end