class Comment < ActiveRecord::Base
  validates :commenter, :body, :presence => true
  belongs_to :post
end
