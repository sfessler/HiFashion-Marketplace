class Listing < ApplicationRecord
	has_attached_file :image, styles: { medium: "200x>", thumb: "100x>" }, default_url: "images.jpeg"
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
