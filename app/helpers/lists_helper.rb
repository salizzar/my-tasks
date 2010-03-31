module ListsHelper
  def insert_task_link(text, form_builder)
    html = load_template(form_builder)
    link_to_function(text, h("insert_task(this, \"#{escape_javascript(html)}\")"))
  end

  def remove_task_link(text, form_builder)
    form_builder.hidden_field(:_destroy) + link_to_function(text, 'remove_task(this)')
  end

  def watch_link(list)
    text = current_user.is_watching?(list) ? 'Unwatch' : 'Watch'
    link_to text, :controller => 'users/lists', :action => 'toggle_watch', :id => list
  end

private

  def load_template(form_builder)
    form_builder.fields_for(:tasks, Task.new, :child_index => 'NEW_RECORD') do |f|
      render 'task', :f => f
    end
  end
end
