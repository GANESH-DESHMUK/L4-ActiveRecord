require 'date'
require 'active_record'

class Todo < ActiveRecord::Base
  def is_due_today?
    due_date == Date.today
  end
 def self.due_today?
    where("due_today = ?", Date.today)
 end

  def self.overdue?
    where("due_date < ?", Date.today)
  end

  def self.due_later?
    where("due_date > ?", Date.today)
  end

  def to_displayable_string
    display_id = id
    display_status = completed ? "[X]" : "[ ]"
    display_date = due_today? ? nil : due_date
    "#{display_id}. #{display_status} #{todo_text} #{display_date}"
  end

  def self.show_list
    puts("My Todo-list\n")
    puts("Overdue \n")
    overdue?.map {|todo| puts todo.to_displayable_string }

    puts("\nDue Today\n")
    due_today?.map {|todo| puts todo.to_displayable_string }

    puts("\nDue Later\n")
    due_later?.map {|todo| puts todo.to_displayable_string }
  end

  def self.add_task(todo_row)
    Todo.create!(todo_text: todo_row[:todo_text], due_date: Date.today + todo_row[:due_in_days], completed: false)
  end

  def self.mark_as_complete(todo_id)
        Todo.update(todo_id, completed: true)

  end
end