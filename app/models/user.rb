class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'には英字と数字の両方を含めて設定してください'}
  with_options format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください'} do
    validates :first_name
    validates :last_name
  end
  with_options format: {with: /\A[ァ-ヶ]+\z/, message: '全角カナ文字を使用してください'} do
    validates :kana_first_name
    validates :kana_last_name
  end
end
