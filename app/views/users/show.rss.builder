xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "#{ @user.name }'s Bits"
    xml.description "Links from #{ @user.name }"
    xml.link user_url

    for item in @user.items
      xml.item do
        
        xml.author do |author|
          author.name item.user.name
          author.uri user_url(item.user)
        end
        
        xml.title item.title
        xml.description to_markdown(item.description) + "<br><br>".html_safe + 
          link_to("(permalink)", item_url(item.id)) # this could be cleaner
        xml.pubDate item.created_at.to_s(:rfc822)
        xml.link item.url
        xml.guid item.url
      end
    end
  end
end
