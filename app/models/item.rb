class Item < ActiveRecord::Base
  belongs_to :user
  
  # Overriding ActiveRecord's default, which just returns the record's ID
  # to_param is called when you pass an object to a url_helper, eg: item_path(@item) < calls @item.to_param
  # ActiveRecord's find() converts its argument to an integer. 
  # Any string converted to an integer will return all integers up until the first non-integer character, or 0 if there aren't any
  # eg: "95-edward-is-a-dick" #=> 95
  # Try it
  def to_param
    "#{id}-#{title.parameterize}"
  end
end
