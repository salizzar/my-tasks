class Users::ListsController < InheritedResources::Base
  acts_as_user

  def public_lists
    @lists = List.public_lists
  end

  def watched_lists
    @lists = List.watched_lists
  end
end
