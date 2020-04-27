require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/customer_controller')
require_relative('controllers/lesson_controller')
require_relative('controllers/customers_lessons_controller')

get '/' do
  erb( :index )
end