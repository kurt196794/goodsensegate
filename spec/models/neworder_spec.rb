require 'rails_helper'

RSpec.describe Neworder, type: :model do
    before do 
      product = FactoryBot.create(:product)      
      user = FactoryBot.create(:user)      
      @neworder = FactoryBot.build(:neworder, user_id: user.id, product_id: product.id)
    sleep(0.1)
    end
  
    
   describe '商品購入機能' do

    context '内容に問題ない場合' do
      it 'すべての情報があれば登録できる' do
        expect(@neworder).to be_valid
      end
      it "建物名はなくても保存できる" do
       @neworder.building_name = ''
       expect(@neworder).to be_valid
      end
    end

     context '内容に問題がある場合' do

            it "郵便番号の保存にはハイフンが必要であること（123-4567となる）"do
            @neworder.postal_code = "123456"
            @neworder.valid?
            expect(@neworder.errors.full_messages).to include("Postal code is invalid")
            end

            it "電話番号は11桁以内の数値のみ保存可能なこと（09012345678となる）"do
            @neworder.phone_number = "123456123456"
            @neworder.valid?
            expect(@neworder.errors.full_messages).to include("Phone number is invalid")

            end
            it "郵便番号が空ではいけないこと"do
            @neworder.postal_code = ""
            @neworder.valid?
            expect(@neworder.errors.full_messages).to include("Postal code can't be blank")
            end

            it "発送元の地域についての情報は一行目以外を入力すること" do
            @neworder.delivery_area_id = 1
            @neworder.valid?
            expect(@neworder.errors.full_messages).to include("Delivery area must be other than 1")
            end

            it  "市区町村が空ではいけないこと" do
            @neworder.municipalities= ''
            @neworder.valid?
            expect(@neworder.errors.full_messages).to include("Municipalities can't be blank")
            end

            it "番地が空ではいけないこと" do
            @neworder.address= ""
            @neworder.valid?
            expect(@neworder.errors.full_messages).to include("Address can't be blank")
            end

            it "電話番号が空ではいけないこと" do
            @neworder.phone_number= ''
            @neworder.valid?
            expect(@neworder.errors.full_messages).to include("Phone number can't be blank")
            end


            it "phone_numberが英数混合では登録できないこと" do
              @neworder.phone_number= "aa123456789"
              @neworder.valid?
              expect(@neworder.errors.full_messages).to include("Phone number is invalid")
              end

            it "tokenが空では登録できないこと" do
              @neworder.token = nil
              @neworder.valid?
              expect(@neworder.errors.full_messages).to include("Token can't be blank")
            end

            it "user_idが空だと登録できない" do
            @neworder.user_id= ""
            @neworder.valid?
            expect(@neworder.errors.full_messages).to include("User can't be blank")
            end

            it " product_idが空だと登録できない" do
            @neworder.product_id= ""
            @neworder.valid?
            expect(@neworder.errors.full_messages).to include("Product can't be blank")
            end

      end
  end
end

