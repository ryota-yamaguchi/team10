class Room < ActiveRecord::Base
  unloadable

  belongs_to :author_user, class_name: 'User', foreign_key: 'author_id'
  belongs_to :owner_user, class_name: 'User', foreign_key: 'owner_id'

end
