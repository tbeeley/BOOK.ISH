require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'

require './app/models/link'
require './app/models/tag'
require './app/models/user'

require_relative './helpers/application.rb'
require_relative 'data_mapper_setup'
require_relative './helpers/session.rb'

include SessionHelpers

require_relative 'controllers/homepage'
require_relative 'controllers/tags'
require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'controllers/links'

	enable :sessions
	set :session_secret, 'super secret'
	set :views, Proc.new { File.join(root, "views") }
	set :partial_template_engine, :erb
	use Rack::Flash
	set :public_dir, Proc.new { File.join(root, "..", "public") }

