class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  def show
  @product = Product.find(params[:id])
  end
  def add_item
    sample_properties = {
    'deal' => {
    'Name' => Product.find_by_id(params[:id]).product_name,
   'Deal value' => Product.find_by_id(params[:id]).product_rate
  }
}
  FreshsalesAnalytics::identify(cookies[:user_email], sample_properties)
  	 redirect_to products_path(alert: true)
 	flash[:alert] = "Product added to cart successfully"
  	FreshsalesAnalytics::trackEvent(cookies[:user_email], 'Product added to cart successfully')
   	@key = 'mEltUY514mis89SaF7wVpjVppIYS1OVH'
      auth = 'Basic ' + Base64.encode64(@key + ':X').chomp
      response = HTTParty.post("https://api.segment.io/v1/track",
                               {
                                 :body =>  {"event" =>  "Product added to cart" , "userId" => cookies[:user_email]}.to_json,
                                 :headers => {'Content-Type' => 'application/json', 'Accept' => 'application/json' , 'Authorization' => auth}
      })
  end

   def add_wish
  	 redirect_to products_path(alert: true)
 	flash[:alert] = "Product added to wish list successfully"
  	FreshsalesAnalytics::trackEvent(cookies[:user_email], 'Product added to wish list successfully')
   	@key = 'mEltUY514mis89SaF7wVpjVppIYS1OVH'
      auth = 'Basic ' + Base64.encode64(@key + ':X').chomp
      response = HTTParty.post("https://api.segment.io/v1/track",
                               {
                                 :body =>  {"event" =>  "Product added to wish list" , "userId" => cookies[:user_email]}.to_json,
                                 :headers => {'Content-Type' => 'application/json', 'Accept' => 'application/json' , 'Authorization' => auth}
      })
  end

  def checkout
  	 redirect_to products_path(alert: true)
 	flash[:alert] = "Thanks for buying"
  	FreshsalesAnalytics::trackEvent(cookies[:user_email], 'checkout')
   	@key = 'mEltUY514mis89SaF7wVpjVppIYS1OVH'
      auth = 'Basic ' + Base64.encode64(@key + ':X').chomp
      response = HTTParty.post("https://api.segment.io/v1/track",
                               {
                                 :body =>  {"event" =>  "checkout" , "userId" => cookies[:user_email]}.to_json,
                                 :headers => {'Content-Type' => 'application/json', 'Accept' => 'application/json' , 'Authorization' => auth}
      })
  end

end

