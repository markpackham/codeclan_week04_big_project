require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/lesson.rb")
also_reload("../models/*")

get "/lessons" do
  @lessons = Lesson.all()
  erb (:"lessons/index")
end

get "/lessons/new" do
  @lessons = Lesson.all()
  erb(:"lessons/new")
end

get "/lessons/:id" do
  @lessons = Lesson.find(params["id"].to_i)
  erb(:"lessons/show")
end

post "/lessons" do
  @lessons = Lesson.new(params)
  @lessons.save()
  erb(:"lessons/index")
end

post "/lessons/:id/delete" do
  Lesson.delete(params[:id])
  redirect to("/lessons")
end
