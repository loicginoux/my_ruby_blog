class User < ActiveRecord::Base
  acts_as_authentic
  has_and_belongs_to_many :groups
  has_many :comments
  has_many :posts
  
  def role_symbols
    groups.map do |group|
      group.name.underscore.to_sym
    end
  end
end
