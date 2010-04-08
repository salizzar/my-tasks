Factory.define :watch do |w|
  w.user { |user| user.association(:user) }
  w.list { |list| list.association(:list) } 
end

