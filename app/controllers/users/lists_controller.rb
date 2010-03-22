class Users::ListsController < InheritedResources::Base
  acts_as_user

  def list_public
    @lists = List.list_public
  end

  def watched_lists
    @lists = List.watched_lists
  end
end
