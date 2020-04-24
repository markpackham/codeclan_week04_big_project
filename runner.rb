require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/customer_controller')
require_relative('controllers/lesson_controller')
require_relative('controllers/register_controller')

get '/' do
  erb( :index )
end