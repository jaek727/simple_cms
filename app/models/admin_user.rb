class AdminUser < ActiveRecord::Base
  
  has_and_belongs_to_many :pages
  has_many :section_edits

  # you can get to sections if you go through section_edits
  has_many :sections, :through => :section_edits

  scope :named, lambda { |first,last| where(:first_name => first, :last_name => last)}
end