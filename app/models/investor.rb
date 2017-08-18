class Investor < ActiveRecord::Base
  has_many :investments
  has_many :exchanges, through: :investments

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


end
