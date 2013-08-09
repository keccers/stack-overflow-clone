module ApplicationHelper
  def time_in_words(timestamp)
  	time_ago_in_words(timestamp).gsub('about','') + ' ago'
  end
end
