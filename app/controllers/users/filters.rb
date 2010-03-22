module Users::Filters
  def acts_as_user(options = {})
    before_filter :authenticate_user!, :get_current_user
    defaults options.reverse_merge(:route_prefix => nil)
    include ControllerMethods
  end

  module ControllerMethods
  protected
    def begin_of_association_chain
      @current_user
    end
    
    def get_current_user
      @current_user ||= current_user
    end
  end
end
