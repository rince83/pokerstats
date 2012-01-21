class Player < ActiveRecord::Base
   has_many :participations
  
  
  
  def net_result
    result = 0
    participations.each do |p|
      result = result + p.net_worth
    end
    result
  end

  def rel_net_result
    net_result.to_f / participations.size
  end

  def points
    result = 0
    participations.each do |p|
      result  = result + p.points
    end
    result
  end
  
  def score
    result = 0
    participations.each do |p|
        result =  result + p.score
    end
    result
  end
  
  def rel_score
    score.to_f / participations.size
  end

  def rebuys
    result = 0
    participations.each do |p|
      result = result + p.number_of_rebuys
    end
    result
  end

  def timeline
    data = Array.new
    labelx = Array.new
    last = 0
    counter = 0
    min = 0
    max = 0
    participations.each do |p|
      counter = counter + 1
      last = (p.net_worth + last)
      if (last > max)
        max = last
      end
      if (last < min)
        min = last
      end
      data.push last
      if (counter % 2 == 0)
        labelx.push p.tournament.date
      end
    end
    Gchart.line(:data => data, :axis_with_labels => 'x,y',:axis_labels => [labelx], :width => 600, :min_value => min, :max_value => max)
  end
  
  def timeline_score
    data = Array.new
    labelx = Array.new
    last = 0
    counter = 0
    min = 0
    max = 0
    participations.each do |p|
      counter = counter + 1
      last = (p.score + last)
      if (last > max)
        max = last
      end
      if (last < min)
        min = last
      end
      data.push last
      if (counter % 2 == 0)
        labelx.push p.tournament.date
      end
    end
    Gchart.line(:data => data, :axis_with_labels => 'x,y',:axis_labels => [labelx], :width => 600, :min_value => min, :max_value => max)
  end
  
end
