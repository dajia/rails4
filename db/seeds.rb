# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Section.destroy_all
Page.destroy_all
Subject.destroy_all
AdminUser.destroy_all

(1..4).each do |index|
  s = Subject.create!(name: "Subject-#{index}")
  (1..3).each do | index2|
    num = "#{index}-#{index2}"
    p = Page.create!(name: "Page-#{num}",
                      permalink: "page-#{num}",
                      subject: s)
    (1..5).each do | index3 |
      num2 = "#{num}-#{index3}"
      c = Section.create!(name: "Section-#{num2}",
                          content_type: "text",
                          content: "BLA BLA from section #{num2}",
                          page_id: p.id)
    end
  end
end

u = AdminUser.create!(first_name: "Dajia", last_name: "Dimitriou", username: "dajiadim", password: "123456", email: "dajia@example.com")
