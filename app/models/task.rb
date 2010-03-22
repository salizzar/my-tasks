class Task < ActiveRecord::Base
  belongs_to :list

  validates_presence_of :name, :list
  validates_format_of   :name, :with => /[a-zA-Z0-9]$/i
end
