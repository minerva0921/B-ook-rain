class Book < ApplicationRecord
  belongs_to :user, optional: true

  #validates :title, presence: true

  def self.search(search)
    if search
      where(['title LIKE ?', "%#{search}%"]) #titleの部分一致を表示
    else
      all #全て表示
    end
  end

end
