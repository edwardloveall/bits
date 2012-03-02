xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "#{ @user.username }'s Bits"
    xml.description "Links from #{ @user.username }"
    xml.link user_url

    for item in @user.items
      xml.item do
        xml.title item.title
        xml.description item.description + "<br /><br />" + 
          link_to("(permalink)", item_url(item.id)) # this could be cleaner
        xml.pubDate item.created_at.to_s(:rfc822)
        xml.link item.url
        xml.guid item.url
      end
    end
  end
end
