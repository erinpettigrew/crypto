class Exchange < ActiveRecord::Base
  has_many :investments
  has_many :investors, through: :investments
  has_many :exchange_incidents
  has_many :incidents, through: :exchange_incidents

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [
      [:name]
    ]
  end

  def should_generate_new_friendly_id?
    name_changed?
  end

  mount_uploader :image, ImageUploader

  searchkick

end
