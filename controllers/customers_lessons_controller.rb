require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/customer_lesson.rb")
require_relative("../models/lesson.rb")
require_relative("../models/customer.rb")
also_reload("../models/*")

get "/customers-lessons" do
  @customer_lesson = Customer_Lesson.all()
  erb(:"customers-lessons/index")
end

get "/customers-lessons/new" do
  @customer = Customer.all()
  @lesson = Lesson.all()
  erb(:"customers-lessons/new")
end

get "/customers-lessons/:id" do
  @customer_lesson = Customer_Lesson.find(params["id"].to_i)
  erb(:"customers-lessons/show")
end

post "/customers-lessons" do
  @customers-lessons = Customer_Lesson.new(params)
  @customers-lessons.save()
  redirect to("/customers-lessons")
end

get "/customers-lessons/:id/edit" do
  @customer_lesson = Customer_Lesson.all
  @customer_lesson = Customer_Lesson.find(params["id"])
  erb(:"customers-lessons/edit")
end

post "/customers-lessons/:id" do
  customer_lesson = Customer_Lesson.new(params)
  customer_lesson.update()
  redirect to "/customers-lessons/#{params["id"]}"
end

post "/customers-lessons/:id/delete" do
  Customer_Lesson.delete(params[:id])
  redirect to("/customers-lessons")
end
