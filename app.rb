require('sinatra')
require('sinatra/reloader')
require('./lib/task')
also_reload('lib/**/*.rb')
require("pg")
require "pry"

DB = PG.connect({:dbname => "to_do_josh"})

get("/") do
  @tasks = Task.all()
  erb(:index)
end

post("/tasks") do
  description = params.fetch("description")
  task = Task.new(:description => description, :list_id => 0)
  task.save()
  erb(:success)
end
