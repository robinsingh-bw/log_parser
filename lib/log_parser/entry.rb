module LogParser
  class Entry
    attr_accessor :url, :ip

    def initialize(url, ip)
      self.url = url
      self.ip = ip
    end
  end
end
