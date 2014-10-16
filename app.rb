# app.rb

# use bundler
require 'rubygems'
require 'bundler/setup'
# load all of the gems in the gemfile
Bundler.require
require './models/TodoItem'

ActiveRecord::Base.establish_connection(
	adapter: 'sqlite3',
	database: 'db/development.db',
	encoding: 'utf8'
)

get '/' do
	@tasks = TodoItem.all.order(:due_date)
	erb :index
end

post '/' do
	TodoItem.create(params)
	redirect '/'
end

#get '/' do
#	# lines.each do |line|
#	# 	@tasks = line.split("\n")
#	# end
#	erb :index
#end

#post '/' do
#	File.open('todo.txt', 'a+') do |file|
#		unless params[:date].empty?
#			file.puts "#{params[:task]} - #{params[:date]}" 
#		else 
#			file.puts "#{params[:task]}"
#		end
#	end
#	redirect '/'
#end
