# given a string with the time of the form "[H]H:MM [AM|PM]", e.g., "11:13 AM"
# and an integer of minutes to add to the time
# return a new string with the new time

def add_minutes_large(time_string, minutes_added)
  new_am_pm = time_string[-2..-1]
  new_minutes = time_string[-5..-4].to_i + minutes_added
  new_hour = time_string[0..-7].to_i
  if new_minutes > 59
    additional_hours = new_minutes / 60
    new_minutes = new_minutes % 60
    new_hour = new_hour + additional_hours
  end

  if new_minutes < 9
    new_minutes = "0" + new_minutes.to_s
  else
    new_minutes = new_minutes.to_s
  end
  
  if new_hour > 11
    new_day = new_hour / 12
    new_hour = new_hour % 12
    new_hour = 12 if new_hour == 0
    new_day.times do 
      new_am_pm = new_am_pm == "AM" ? "PM" : "AM"
    end
  end
  
  time_string[-2..-1] = new_am_pm
  time_string[-5..-4] = new_minutes
  time_string[0..-7] = new_hour.to_s
  return time_string
end

# Same idea, but modular

def add_minutes_modular(time_string, minutes_added)
  new_minutes,additional_hours = adjust_minutes(time_string[-5..-4].to_i, minutes_added)

  new_hour,number_of_am_pm_shifts = adjust_hours(time_string[0..-7].to_i, additional_hours)

  new_am_pm = adjust_am_pm(time_string[-2..-1], number_of_am_pm_shifts)

  time_string[-2..-1] = new_am_pm
  time_string[-5..-4] = new_minutes
  time_string[0..-7] = new_hour
  return time_string
end

def adjust_minutes(minutes, minutes_added)
  new_minutes = minutes + minutes_added
  additional_hours = new_minutes / 60
  new_minutes = (new_minutes % 60).to_s  
  if new_minutes.length == 1
    new_minutes = "0" + new_minutes
  end
  return new_minutes, additional_hours
end

def adjust_hours(hours, hours_added)
  new_hour = hours + hours_added
  am_pm_shifts = 0
  if new_hour > 11
    am_pm_shifts = new_hour / 12
    new_hour = new_hour % 12
    new_hour = 12 if new_hour == 0
  end
  am_pm_shifts -= 1 if hours == 12
  return new_hour.to_s, am_pm_shifts
end

def adjust_am_pm(meridian, number_of_am_pm_shifts)
  number_of_am_pm_shifts.times do
    meridian = meridian == "AM" ? "PM" : "AM"    
  end
end
