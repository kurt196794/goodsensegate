class Smallcategory < ActiveHash::Base

  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'tops' },
    { id: 3, name: 'Jacket/outer' },
    { id: 4, name: 'pants' },
    { id: 5, name: 'shoes' },
    { id: 6, name: 'Bag' },
    { id: 7, name: 'suit' },
    { id: 8, name: 'hat' },
    { id: 9, name: 'Accessories' },
    { id: 11, name: 'Other items' },
  ]
  

  include ActiveHash::Associations
  has_many :products

end