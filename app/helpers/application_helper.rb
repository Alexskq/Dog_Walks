module ApplicationHelper
  def dog_photo_tag(dog, size: :small)
    unless dog
      return image_tag 'default_dog.png',
                       alt: 'photo par défaut',
                       class: "rounded-full #{size == :small ? 'w-6 h-6' : 'w-10 h-10'} object-cover bg-gray-200"
    end

    if dog.photo.attached?
      image_tag dog.photo,
                alt: "photo de #{dog.name}",
                class: "rounded-full #{size == :small ? 'w-6 h-6' : 'w-10 h-10'} object-cover"
    else
      image_tag 'default_dog.png',
                alt: "photo par défaut de #{dog.name}",
                class: "rounded-full #{size == :small ? 'w-6 h-6' : 'w-10 h-10'} object-cover bg-gray-200"
    end
  end

  def walk_has_invalidated_participants?(walk)
    walk.user_walks.any?(&:invalidated?)
  end
end
