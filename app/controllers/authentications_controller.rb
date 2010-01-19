class AuthenticationsController < ApplicationController

  before_filter :only_admins
  
  def create
    if person = Person.authenticate(params[:authentication][:email], params[:authentication][:password])
      render :xml => person.to_xml(:except => ['salt', 'encrypted_password', 'feed_code', 'api_key']), :status => 201
    elsif person == nil
      render :text => 'email not found', :status => 404
    else
      render :text => 'password incorrect', :status => 401
    end
  end
  
  private
  
    def only_admins
      unless @logged_in.super_admin?
        render :text => I18n.t('only_admins'), :layout => true, :status => 400
        return false
      end
    end

end