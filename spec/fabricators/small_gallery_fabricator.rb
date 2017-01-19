Fabricator(:small_gallery) do
  title { Faker::Lorem.sentence }
  main_image_file_name { 'project.png' }
  main_image_file_size { 66456 }
  main_image_content_type { 'image/png' }
  main_image_updated_at { DateTime.current }
end
