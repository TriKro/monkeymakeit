Factory.sequence :email do |n|
  "person#{n}@example.com"
end

Factory.sequence :invite_code do |n|
  (n.to_i + 1000).to_s(36)
end

Factory.define :user do |s|
  s.email { Factory.next(:email) }
  s.invite_code { Factory.next(:invite_code) }
  s.invited_by nil
end
