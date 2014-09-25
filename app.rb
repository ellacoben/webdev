# app.rb

# use bundler
require 'rubygems'
require 'bundler/setup'
# load all of the gems in the gemfile
Bundler.require

get '/' do
	@lines = File.read("todo.txt").split("\n")
	# lines.each do |line|
	# 	@tasks = line.split("\n")
	# end
	erb :index
end

post '/' do
	File.open('todo.txt', 'a+') do |file|
		unless params[:date].empty?
			file.puts "#{params[:task]} - #{params[:date]}" 
		else 
			file.puts "#{params[:task]}"
		end
	end
	redirect '/'
end
