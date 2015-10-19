class Comment < ActiveRecord::Base
  validates :author_id, :commentable_id, :body, presence: true

  belongs_to(
    :commentable,
    polymorphic: true
  )

  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :author_id,
    primary_key: :id
  )

end
