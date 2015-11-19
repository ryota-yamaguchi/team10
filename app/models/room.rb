class Room < ActiveRecord::Base
  unloadable

  # Varidates
  validates :project_id,
            presence: true
  validates :name,
            presence: true
  validates :description,
            presence: true

  # Belogs to
  belongs_to :author_user, class_name: 'User', foreign_key: 'author_id'
  belongs_to :owner_user, class_name: 'User', foreign_key: 'owner_id'
  belongs_to :project_name, class_name: 'Project', foreign_key: 'project_id'

end
