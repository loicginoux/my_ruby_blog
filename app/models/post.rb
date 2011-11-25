class Post < ActiveRecord::Base
  validates :name,  :presence => true
  validates :title, :presence => true
  has_many :comments, :dependent => :destroy
  has_many :tags
  belongs_to :user

  accepts_nested_attributes_for :tags, :allow_destroy => :true,
  :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end