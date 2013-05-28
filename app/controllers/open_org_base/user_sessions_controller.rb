require "net/http"

module OpenOrgBase
class UserSessionsController < ApplicationController
  skip_before_filter :requires_authentication

  def new
  end

  def create
    user = User.find_by_email_address(params[:email_address]) 
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to main_app.root_url, :notice => "Logged in"
    else
      flash.now.alert = "Invalid email or password"
      render :new
    end

=begin
    puts "assertion = #{params['assertion'].inspect}"

    assertion = params["assertion"]
    if assertion == "mock" then
      json = {"status" => "okay"}      
    else
      http = Net::HTTP.new("verifier.login.persona.org", 443)
      http.use_ssl = true
      request = Net::HTTP::Post.new("/verify")
      request.form_data = {'assertion' => assertion, 'audience' => "http://localhost:3000"}
      response = http.request(request)

      puts "response = #{response.inspect}"
      json = JSON.parse response.body
    end

    if (json["status"] == "okay") 
      #
      # {
      #   "status"=>"okay", 
      #   "email"=>"stevetuckner@stewdle.com", 
      #   "audience"=>"http://localhost:3000", 
      #   "expires"=>1349026927383, 
      #   "issuer"=>"login.persona.org"
      # }
      #
      user = User.find_by_email_address(json["email"])
      if user then
        render :text => "OK"
      else
        user = User.create(:email_address => json["email"])
        render :text => "OK"
      end
      session[:user_id] = user.id
    else
      
    end
    puts "json = #{json.inspect}"
=end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
end
