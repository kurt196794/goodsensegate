require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
      @product = FactoryBot.build(:product)
  end



  describe '商品出品機能' do

    context '新規登録できるとき' do
      it '全ての値が正常であれば登録できる'do
      expect(@product).to be_valid
    end
  end

    context '新規登録できないとき' do
       it '画像が空では登録できないこと' do 
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
       end


      it '商品名が必須であること' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が必須であること'do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
      it'カテゴリーの情報が必須であること'do
        @product.category_id =''
        @product.valid?
        expect(@product.errors.full_messages).to include("Category is not a number")
      end
      it'カテゴリー詳細の情報が必須であること'do
        @product.smallcategory_id =''
        @product.valid?
        expect(@product.errors.full_messages).to include("Smallcategory is not a number")
      end

      it'配送料の負担についての情報が必須であること'do
        @product.shipping_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping is not a number")
      end

      it'発送元の地域についての情報が必須であること'do
        @product.delivery_area_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery area is not a number")
      end

      it'発送までの日数についての情報が必須であること'do
        @product.delivery_date_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery date is not a number")
      end
      it'販売価格についての情報が必須であること'do
        @product.price= ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end

      it'販売価格は、¥300以上が保存可能であること'do
      @product.price= 200
      @product.valid?
      expect(@product.errors.full_messages).to include("Price is not included in the list")
      end

      it'販売価格は、¥10000000以上だと保存できないこと'do
      @product.price= 10000000
      @product.valid?
      expect(@product.errors.full_messages).to include("Price is not included in the list")
      end

      it'販売価格は半角数字のみ保存可能であること'do
      @product.price= 'aa'
      @product.valid?
      expect(@product.errors.full_messages).to include("Price is not included in the list")
      end

      it'カテゴリーの情報は一行目以外を入力すること'do
      @product.category_id = 1
       @product.valid?
       expect(@product.errors.full_messages).to include("Category must be other than 1")
      end
      
      it'カテゴリー詳細についての情報は一行目以外を入力すること'do
      @product.smallcategory_id = 1
       @product.valid?
       expect(@product.errors.full_messages).to include("Smallcategory must be other than 1")
      end

      it'配送料の負担についての情報は一行目以外を入力すること'do
      @product.shipping_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Shipping must be other than 1")
      end

    it'発送元の地域についての情報は一行目以外を入力すること'do
      @product.delivery_area_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Delivery area must be other than 1")
    end

    it'発送までの日数についての情報は一行目以外を入力すること'do
      @product.delivery_date_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Delivery date must be other than 1")
    end
  end 

  end  
end