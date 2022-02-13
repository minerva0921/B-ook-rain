class Book < ApplicationRecord
  belongs_to :user, optional: true

  #validates :title, presence: true
  attachment :image

  def self.search(search)
    if search
      Book.where(['title LIKE ?', "%#{search}%"]) #titleの部分一致を表示
    else
      Book.all #全て表示
    end
  end

end
