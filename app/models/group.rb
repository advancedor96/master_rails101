class Group < ActiveRecord::Base
	validates :title, :presence => { :message => "不能空白" }
	belongs_to :owner, class_name: "User", foreign_key: :user_id
	has_many :posts
end
