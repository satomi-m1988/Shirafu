class Relationship < ApplicationRecord
	belongs_to :following, class_name: "User" #'class_name'はUserモデルから擬似的にfollowingモデルを作成している
	belongs_to :follower, class_name: "User" #'class_name'はUserモデルから擬似的にfollowerモデルを作成している
end
