class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(params[:user])
    @user.save
    if @user.save
      flash[:alert] = "Welcome way to go!"
      cookies[:user_email] = @user.email
      cookies[:id] = @user.id
      redirect_to static_pages_home_path
      @key = 'mEltUY514mis89SaF7wVpjVppIYS1OVH'
      auth = 'Basic ' + Base64.encode64(@key + ':X').chomp
      response = HTTParty.post("https://api.segment.io/v1/identify",
                               {
                                 :body =>  {"type" =>  "identify" , "traits" => { "lastName" => @user.name, "email" => @user.email, "company" => {"name" => @user.name }}, "userId" => @user.email}.to_json,
                                 :headers => {'Content-Type' => 'application/json', 'Accept' => 'application/json' , 'Authorization' => auth}
      })
    end
  end
end

