module ApplicationHelper
  
 def pretty_date(date, options={}) # compliments of Bryan Ricker
   format = options[:format].to_s
   default = "%b %e, %Y"
   case format
    when "numbers"
     formatted = date.strftime("%-m-%-d-%y") # 2-5-04
    when "full"
     formatted = date.strftime("%B #{date.day.ordinalize}, %Y") # October 11th, 2011
    when "custom"
     formatted = date.strftime(options[:with] || default)
    else
     formatted = date.strftime(default) # Oct 11, 2011
    end
  end
end