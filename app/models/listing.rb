class Listing < ApplicationRecord
	if Rails.env.development?
	has_attached_file :image, styles: { medium: "200x>", thumb: "100x>" }
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/ 
	validates :name, :description, :price, presence: true
  	validates :price, numericality: { greater_than: 0 }
	else
	has_attached_file :image, styles: { medium: "200x>", thumb: "100x>" },
					  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/ 
					  #:default_url=> "images.jpeg",
					  :path => ":style/:id_:filename",
    				  :storage => :s3,
    			   	  :s3_region => "us-east-2",
    				  :s3_host_name => 's3-us-east-2.amazonaws.com', 
    				  :url => ":s3.amazonaws.com/hifashion-images", 
						
						:s3_credentials => Proc.new{|a| a.instance.s3_credentials } 
						def s3_credentials 
						{:bucket => "hifashion-images1", :access_key_id => ENV["access_key_id"]  , :secret_access_key => ENV["secret_access_key"]} 

						validates :name, :description, :price, presence: true
  						validates :price, numericality: { greater_than: 0 }
						end 
	end
	belongs_to :user
end