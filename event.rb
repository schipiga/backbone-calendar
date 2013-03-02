class Event < ActiveRecord::Base

  REPEATITION = { none: 0, daily: 1, weekly: 2, monthly: 3, yearly: 4 }

  def for_day date = Time.now, repeat = 'none'
    where alarm_date = date
  end

  protected
  def repeated repeat

    types.each do |type|
      alarm_date.send(type) == date.send(type)
    end
    
    where alarm_date < date and repeatition = REPEATITION[repeat]
    where alarm_date < date and alarm_date.wday = date.wday
    where alarm_date < date and alarm_date.month = date.month and alarm_date.day = alarm_date.day
    where alarm_date < date and alarm_date.year = date.year and alarm_date.month = date.month and alarm_date.day = alarm_date.day
  end
end
