class Users::ListsController < InheritedResources::Base
  acts_as_user

  def show_public
    @lists = List.find_public_from_others @current_user.id
  end

  def show_watched
    @lists = List.find_watched @current_user.watches
  end

  def toggle_watch
    watch = Watch.toggle(@current_user.id, params[:id])
    flash[:notice] = "List was successfully #{ watch ? 'watched' : 'unwatched' }."
    redirect_to :action => 'show_public'
  end
end
