# app.rb

# use bundler
require 'rubygems'
require 'bundler/setup'
# load all of the gems in the gemfile
Bundler.require
require './models/TodoItem'

if ENV['DATABASE_URL'] 
	ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
else
	ActiveRecord::Base.establish_connection(
	:adapter => 'sqlite3',
	:database => 'db/development.db',
	:encoding =>'utf8'
)
end

 get '/' do
	 @tasks = TodoItem.all.order(:due_date)
	 erb :index
 end

 post '/' do
	 TodoItem.create(description: params[:task], due_date: params[:date])
	 redirect '/'
 end

#get 'delete/:id' do
#	TodoItem.find(params[:id]).destroy
#	redirect '/'
#end

# get '/' do
 #	@lines = File.read("todo.txt").split("\n")
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
