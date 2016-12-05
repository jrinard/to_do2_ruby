require('sinatra')
require('sinatra/reloader')
require('./lib/task')
also_reload('lib/**/*.rb')
require("pg")
require("pry")

DB = PG.connect({:dbname => "to_do_josh"})

get("/") do
  @tasks_permanent_array = Task.all()
  erb(:index)
end

post("/tasks") do
  description = params.fetch("description")
  due_date = params.fetch("due_date")
  task = Task.new(:description => description, :list_id => 0, :due_date => due_date)
  task.save()
  @tasks_permanent_array = Task.all()
  erb(:index)
end

post("/remove") do
  name_to_remove = params.fetch("remove")
  Task.remove(name_to_remove)
  # task = Task.new(:description => description, :list_id => 0, :due_date => due_date)
  # task.save()
  @tasks_permanent_array = Task.all()
  erb(:index)
end
