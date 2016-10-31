module ApplicationHelper
  def helper_picture_background()
    "http://wire.kapitall.com/wp-content/image-import/healthy-food-stocks.jpeg"
  end

  def helper_picture_url(food_truck)
    if food_truck.photo?
      cl_image_path(food_truck.photo.path)
    else
      "https://static.pexels.com/photos/162971/potatoes-french-mourning-funny-162971.jpeg"
    end
  end

end
