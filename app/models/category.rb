class Category < ActiveHash::Base

  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'メンズ' },
    { id: 3, name: 'レディース' },
  ]
  

  include ActiveHash::Associations
  has_many :products

end