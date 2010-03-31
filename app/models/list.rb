class List < ActiveRecord::Base
  belongs_to :user
  has_many   :tasks
  has_many   :watches

  validates_presence_of :name, :description, :tasks, :user_id
  validates_format_of   :name, :with => /[a-zA-Z0-9]$/i
  validates_associated  :tasks

  accepts_nested_attributes_for :tasks, :allow_destroy => true

  def self.find_public_from_others(user_id)
    List.all :conditions => [ 'public = ? AND user_id != ?', true, user_id ]
  end

  def self.find_watched_by_user(watches)
    List.all :conditions => [ 'id in (?)', watches.collect { |watch| watch.list_id } ]
  end
end
