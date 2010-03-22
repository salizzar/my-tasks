module ListsHelper
  def insert_task_link(text, form_builder)
    html = load_template(form_builder)
    link_to_function(text, h("insert_task(this, \"#{escape_javascript(html)}\")"))
  end

  def remove_task_link(text, form_builder)
    form_builder.hidden_field(:_destroy) + link_to_function(text, 'remove_task(this)')
  end

  def load_template(form_builder)
    form_builder.fields_for(:tasks, Task.new, :child_index => 'NEW_RECORD') do |f|
      render 'task', :f => f
    end
  end
end
