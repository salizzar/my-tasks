function insert_task(link, html)
{
  var id = new Date().getTime();
  var regexp = new RegExp('NEW_RECORD', 'g');
  $('div#tasks').append(html.replace(regexp, id));
}

function remove_task(link)
{
  var hidden_field = $(link).prev('input[type=hidden]');
  if (hidden_field)
  {
    hidden_field.attr('value', 1);
  }

  $(link).parent().parent().hide('slow');
}
