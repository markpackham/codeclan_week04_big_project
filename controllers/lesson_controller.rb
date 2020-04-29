require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/lesson.rb")
also_reload("../models/*")

get "/lessons" do
  @lessons = Lesson.all()
  @lessons_cheap = Lesson.cheap()
  @lessons_expensive = Lesson.expensive()
  @average_price = Lesson.average_price()
  @lessons_with_customers = Lesson.lessons_with_customers()
  @lessons_with_no_customers = Lesson.lessons_with_no_customers()
  erb (:"lessons/index")
end

get "/lessons/new" do
  @lessons = Lesson.all()
  erb(:"lessons/new")
end

get "/lessons/:id" do
  @lesson = Lesson.find(params["id"].to_i)
  erb(:"lessons/show")
end

post "/lessons" do
  @lessons = Lesson.new(params)
  @lessons.save()
  redirect to("/lessons")
end

get "/lessons/:id/edit" do
  @lesson = Lesson.all
  @lesson = Lesson.find(params["id"])
  erb(:"lessons/edit")
end

post "/lessons/:id" do
  lesson = Lesson.new(params)
  lesson.update()
  redirect to "/lessons/#{params["id"]}"
end

post "/lessons/:id/delete" do
  Lesson.delete(params[:id])
  redirect to("/lessons")
end
