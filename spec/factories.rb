Factory.sequence :email do |n|
  "person#{n}@example.com"
end

Factory.sequence :code do |n|
  (n.to_i + 1000).to_s(36)
end

Factory.define :user do |s|
  s.email { Factory.next(:email) }
  s.code { Factory.next(:code) }
  s.invited_by nil
end
