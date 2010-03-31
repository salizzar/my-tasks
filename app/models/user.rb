class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :lockable, :timeoutable and :activatable
  devise :registerable, :authenticatable, :confirmable, :recoverable,
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :photo

  has_many :watches,  :dependent => :delete_all
  has_many :lists,    :dependent => :delete_all

  mount_uploader :photo, PhotoUploader

  def is_watching?(list)
    @watches_ids ||= watches.collect(&:list_id)
    @watches_ids.include?(list.id)
  end
end

