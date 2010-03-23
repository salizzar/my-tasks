class List < ActiveRecord::Base
  belongs_to :user
  has_many   :tasks
  has_many   :watches
  has_many   :users, :through => :watches

  validates_presence_of :name, :description, :user, :tasks
  validates_format_of   :name, :with => /[a-zA-Z0-9]$/i
  validates_associated  :tasks

  accepts_nested_attributes_for :tasks, :allow_destroy => true

  named_scope :public_lists, :conditions => { :public => true }
end
