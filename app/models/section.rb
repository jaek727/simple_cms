class Section < ActiveRecord::Base

  belongs_to :page
  has_many :section_edits

  # you can get to admin_users if you go through section_edits
  has_many :editors, :through => :section_edits, :class_name => "AdminUser"

end
