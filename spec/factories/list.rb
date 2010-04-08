Factory.define :list do |l|
  l.name         'A name'
  l.description  'A description'
  l.public       true
  l.user         { |user| user.association(:user) }
  l.tasks        { |tasks| [ tasks.association(:task) ] }
end

