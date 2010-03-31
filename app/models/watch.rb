class Watch < ActiveRecord::Base
  belongs_to :user
  belongs_to :list

  validates_presence_of :user_id, :list_id

  def self.toggle(user_id, list_id)
    watch = Watch.first :conditions => { :user_id => user_id, :list_id => list_id }
    if watch
      Watch.delete_all :user_id => user_id, :list_id => list_id
      watch = nil
    else
      watch = Watch.create :user_id => user_id, :list_id => list_id
    end

    watch
  end
end
