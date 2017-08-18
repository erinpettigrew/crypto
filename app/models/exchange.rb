class Exchange < ActiveRecord::Base
  has_many :investors
  has_many :investments, through: :investors

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
