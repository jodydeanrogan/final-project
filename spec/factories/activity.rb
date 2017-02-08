FactoryGirl.define do
  factory :activity do
    title "Food Activity"
    description  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
    image_data "{\"original\":{\"id\":\"464704d4c714ab7237400f1d2a551dfa.jpg\",\"storage\":\"store\",\"metadata\":{\"size\":710121,\"filename\":\"food.jpg\",\"mime_type\":\"image/jpeg\"}},\"large\":{\"id\":\"c07539c2a480b3da4fda5895b40a563a.jpg\",\"storage\":\"store\",\"metadata\":{\"filename\":\"s320170208-41532-6fil7.jpg\",\"size\":750456,\"mime_type\":\"image/jpeg\"}},\"small\":{\"id\":\"63fe9d49233507369b4560372337d54f.jpg\",\"storage\":\"store\",\"metadata\":{\"filename\":\"s320170208-41532-6fil720170208-41532-sh89al.jpg\",\"size\":87307,\"mime_type\":\"image/jpeg\"}}}"
  end
end
