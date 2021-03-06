xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Bits of Links"
    xml.description "Links for Elizabeth and Edward"
    xml.link items_url
    xml.author do |author|
      author.name "Elizabeth and Edward"
      author.uri root_url
    end
    
    for item in @items
      xml.item do
        
        xml.author do |author|
          author.name item.user.name
          author.uri user_url(item.user)
        end
        
        xml.title item.title
        xml.description to_markdown(item.description)
        xml.pubDate item.created_at.to_s(:rfc822)
        xml.link item.url
        xml.guid item.url
      end
    end
  end
end