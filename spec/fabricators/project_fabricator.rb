Fabricator(:project) do
  name { Faker::Company.name }
  description { Faker::Lorem.paragraph }
  complete_date { Faker::Date.between(2.years.ago, Date.yesterday) }
  main_image_file_name { 'project.png' }
  main_image_file_size { 66456 }
  main_image_content_type { 'image/png' }
  main_image_updated_at { DateTime.current }
end
