class Neworder
  include ActiveModel::Model
  attr_accessor :user_id, :product_id,:postal_code, :delivery_area_id, :municipalities, :address, :building_name, :phone_number, :token


    with_options presence: true do
      validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/}
      validates :municipalities
      validates :address
      validates :phone_number,format:{ with: /\A\d{10,11}\z/}
      validates :delivery_area_id, numericality: {other_than: 1}
      validates :token
      validates :user_id
      validates :product_id

    end

 def save
  
  soldout = Soldout.create(user_id: user_id, product_id: product_id)

  Buyer.create(postal_code: postal_code,delivery_area_id: delivery_area_id,municipalities: municipalities,address: address,building_name: building_name,phone_number: phone_number,soldout_id: soldout.id)
  #Address.create(postal_code: postal_code,delivery_area_id: delivery_area_id,municipalities: municipalities,address: address,building_name: building_name,phone_number: phone_number,sold_id: sold.id)
 end  


end
