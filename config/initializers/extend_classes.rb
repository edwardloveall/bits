require 'digest/md5'

class String
  def int_hash
    Digest::MD5.hexdigest(self).to_i(16)
  end
end