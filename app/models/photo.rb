class Photo < ActiveRecord::Base
  belongs_to :auction

  has_attached_file :image, styles: { medium: "300x300", thumb: "100x100>" },
    :path => ":rails_root/public/images/:id/:filename/:style",
    :url  => "/images/:id/:filename/:style"

  do_not_validate_attachment_file_type :image
end
