module ApplicationHelper
  def helper_picture_background()
    "http://wire.kapitall.com/wp-content/image-import/healthy-food-stocks.jpeg"
  end

  def helper_picture_url(food_truck)
    if food_truck.photo?
      cl_image_path(food_truck.photo.path)
    else
      "http://res.cloudinary.com/dmbf8fog4/image/upload/v1478042739/wooegercx5jlsvjt942y.jpg"
    end
  end

  def helper_picture_tag(food_truck)
    if food_truck.photo?
      cl_image_tag(food_truck.photo.path)
    else
      cl_image_tag("http://res.cloudinary.com/dmbf8fog4/image/upload/v1478042739/wooegercx5jlsvjt942y.jpg")
    end
  end

end
