class Watch < ActiveRecord::Base
# belongs_to :user
# belongs_to :list

  validates_presence_of :user_id, :list_id
end
