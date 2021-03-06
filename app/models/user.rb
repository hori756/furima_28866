class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items ,dependent: :destroy
  has_many :purchases ,dependent: :destroy

  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  VALID_PASSWORD = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  VALID_FULL_LETTERS = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/.freeze
  VALID_KATAKANA = /\A[ァ-ヶー－]+\z/.freeze
  validates :email, format: { with: VALID_EMAIL }, uniqueness: { case_sensitive: false }
  validates :password, format: { with: VALID_PASSWORD }, length: { minimum: 6 }
  with_options presence: true do
    validates :nickname
    validates :birth_date

    with_options format: { with: VALID_FULL_LETTERS } do
      validates :first_name
      validates :family_name
    end

    with_options format: { with: VALID_KATAKANA } do
      validates :first_name_kana
      validates :family_name_kana
    end
  end
end
