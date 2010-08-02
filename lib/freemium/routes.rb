module Freemium
  module Routes #:doc:
    # Adds route generation for invitable. This method is responsible to
    # generate all needed routes for devise, based on what modules you have
    # defined in your model.
    # Examples: Let's say you have an User model configured to use
    # invitable module. After creating this inside your routes:
    #
    #   map.devise_for :users
    #
    # this method is going to look inside your User model and create the
    # needed routes:
    #
    #  # Invitation routes for Invitable, if User model has :invitable configured
    #     new_user_invitation GET  /users/invitation/new(.:format)     {:controller=>"invitations", :action=>"new"}
    #         user_invitation PUT  /users/invitation(.:format)         {:controller=>"invitations", :action=>"update"}
    #                         POST /users/invitation(.:format)         {:controller=>"invitations", :action=>"create"}
    #  accept_user_invitation GET  /users/invitation/accept(.:format)  {:controller=>"invitations", :action=>"edit"}
    #

    protected
      def billable(routes, mapping)
        routes.resource :payable, :only => [:new, :create, :update], :as => mapping.path_names[:billable]
        routes.send(:"accept_#{mapping.name}_invitation", mapping.path_names[:accept] || 'accept', :controller => 'payments', :action => 'edit', :name_prefix => nil, :path_prefix => "#{mapping.as}/payment", :conditions => { :method => :get })
      end
      
      def subscribable(routes, mapping)
      	routes.resource :subscribable, :only => [:new, :create, :update], :as => mapping.path_names[:subscribable]
        routes.send(:"accept_#{mapping.name}_subscribable", mapping.path_names[:accept] || 'accept', :controller => 'subscriptons', :action => 'edit', :name_prefix => nil, :path_prefix => "#{mapping.as}/subscription", :conditions => { :method => :get })        
      end
  end
end

ActionDispatch::Routing::Mapper.send :include, Freemium::Routes