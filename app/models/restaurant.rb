class Restaurant < ApplicationRecord
  acts_as_paranoid
 
  validates :title, presence: true
  belongs_to :user
end





# class Restaurant < ApplicationRecord
#   validates :title, presence: true 

#   # default_scope { available }
#   # scope :available, -> { where(deleted_at: nil) }
#   # # 這邊scope的目的是為了做出一個範圍
#   # 這邊做的是一個假動作，假裝刪除了scope所列出範圍內的內容


#   # # def self.all 
#   # #   # where(deleted_at: nil)
#   # # end
#   # # 上述這個作法，為的是讓self.all定義一個方法

#   # def self.deleted 
#   #   unscope(:where).where.not(deleted_at: nil) 
#   # end 


#   def really_destroy!
#     super.destroy
#   end 
#   # 上述這個方法是真刪除的做法
#   #super.的這個方法是「強調我要刪除了」
    



#   def destroy 
#     update(deleted_at: Time.now)
#   end 
# end 