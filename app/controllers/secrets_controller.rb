class SecretsController < ApplicationController
   before_action :require_login
 
   def show
     @name = current_user
   end
 
   private
 
   def require_login
     redirect_to new_session_path unless session.include? :name
   end
 
end