Fabricator(:image) do
  name { Faker::Company.name }
  description { Faker::Lorem.sentence }
  image_attach_file_name { 'image.png' }
  image_attach_file_size { 66456 }
  image_attach_content_type { 'image/png' }
  image_attach_updated_at { DateTime.current }
end
