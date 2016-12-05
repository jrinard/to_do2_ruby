class Task
  attr_reader(:description, :list_id, :due_date)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
    @list_id = attributes.fetch(:list_id)
    @due_date = attributes.fetch(:due_date)

  end

  define_singleton_method(:all) do
    returned_tasks = DB.exec("SELECT * FROM tasks ORDER By due_date;")
    tasks_array = []
    returned_tasks.each() do |task_from_db|
      id = task_from_db.fetch("id")
      description = task_from_db.fetch("description")
      list_id = task_from_db.fetch("list_id").to_i()
      due_date = task_from_db.fetch("due_date")
      tasks_array.push(Task.new({:description => description, :list_id => list_id, :due_date => due_date}))
    end
    tasks_array
  end

  define_method(:save) do
    DB.exec("INSERT INTO tasks (description, list_id, due_date) VALUES ('#{@description}', #{@list_id}, '#{@due_date}');")
  end
  define_singleton_method(:remove) do |item|
    DB.exec("DELETE FROM tasks WHERE UPPER(description) = UPPER('#{item}');")
  end

  define_method(:==) do |another_task|
    self.description().==(another_task.description()).&(self.list_id().==(another_task.list_id()))
  end
end
