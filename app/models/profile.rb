class Profile < ActiveRecord::Base
  attr_accessible :description, :name, :picture

  validates :name, :presence=>true, :format => { :with => /\A[a-zA-Z\s]+\z/, :message => "Name empty/invalid" }
  validates :description, :presence=>true, length: { minimum: 16 }

  has_attached_file :picture, :styles => { :medium => "260x180" },
	:url => "/assets/profiles/:id/:style/:basename.:extension",
    :path => ":rails_root/public/assets/profiles/:id/:style/:basename.:extension"
  has_one :question
end
