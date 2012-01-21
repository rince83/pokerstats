class Tournament < ActiveRecord::Base
  has_many :participations, :dependent => :destroy
  accepts_nested_attributes_for :participations, :allow_destroy => true
  
  def participants_by_rank
     participations.sort{ |a,b | a.placement <=> b.placement}
  end
end
