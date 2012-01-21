class Participation < ActiveRecord::Base
  belongs_to :tournament
  belongs_to :player
  
  public
  def net_worth
    money_won - (number_of_rebuys * tournament.rebuy_cost + number_of_addons * tournament.addon_cost + tournament.buyin_cost)
  end
  
  public
  def points
    tournament.participations.size - placement - number_of_rebuys
  end
  
  public
  def score
    #result = (tournament.participations.size - (placement-1)).to_f / tournament.participations.size 
    #result = result - 0.5
    #result = result - (2.5*number_of_rebuys.to_f / tournament.participations.size)
    #result
    
    result = (tournament.participations.size - placement).to_f / ( tournament.participations.size-1)
    result = result * 2 -1
    result = result - ((2 * 2*number_of_rebuys).to_f / (tournament.participations.size-1))
  end
  
end
