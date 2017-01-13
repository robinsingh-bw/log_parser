module LogParser
  class Parser
    attr_accessor :entries

    def initialize(entries)
      self.entries = entries
    end

    def order_by_most_views
      entries.
        group_by(&:url).
        map{ |url, entries| [url, entries.map(&:ip).count] }.
        sort_by{ |a| a.last }.
        reverse
    end

    def order_by_most_unique_views
      entries.
        group_by(&:url).
        map{ |url, entries| [url, entries.map(&:ip).uniq.count] }.
        sort_by{ |a| a.last }.
        reverse
    end

    def self.from_array(lines)
      new(lines.map{|line| Entry.new(*line.split(' ')) })
    end

    def self.from_file(file_path)
      from_array(File.read(file_path).split("\n"))
    end
  end
end
