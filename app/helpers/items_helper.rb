module ItemsHelper
  def truncate_url(url)
    truncate(url, length: 110, omission: '...')
  end
end
