require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/customer.rb")
also_reload("../models/*")

get "/customers" do
  @customers = Customer.all()
  erb (:"customers/index")
end

get '/customers/new' do
  @customers = Customer.all()
  erb(:"customers/new")
end

get "/customers/:id" do
  @customer = Customer.find(params["id"].to_i)
  erb(:"customers/show")
end

post '/customers' do
  @customers = Customer.new( params )
  @customers.save()
  erb( :"customers/index" )
end

post '/customers/:id/delete' do
  Customer.delete(params[:id])
  redirect to("/customers")
end