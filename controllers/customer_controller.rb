require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/customer.rb")
also_reload("../models/*")

get "/customers" do
  @customers = Customer.all()
  @high_spenders = Customer.high_spenders()
  erb(:"customers/index")
end

get "/customers/new" do
  @customers = Customer.all()
  erb(:"customers/new")
end

get "/customers/:id" do
  @customer = Customer.find(params["id"].to_i)
  erb(:"customers/show")
end

post "/customers" do
  @customers = Customer.new(params)
  @customers.save()
  redirect to("/customers")
end

get "/customers/:id/edit" do
  @customer = Customer.all
  @customer = Customer.find(params["id"])
  erb(:"customers/edit")
end

post "/customers/:id" do
  customer = Customer.new(params)
  customer.update()
  redirect to "/customers/#{params["id"]}"
end

post "/customers/:id/delete" do
  Customer.delete(params[:id])
  redirect to("/customers")
end
