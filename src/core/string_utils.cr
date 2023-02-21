module Amazonite::Core
  class StringUtils
    def self.to_bool(value : String | Nil)
      return false if value.nil?
      stripped_value = value.strip
      stripped_value.size == 1 ? ["t", "T"].includes?(stripped_value[0]) : /^true$/i.matches?(stripped_value)
    end

    def self.to_time(value : String)
      Time.parse_utc(value, "%Y-%m-%d %H:%M:%S.%6N")
    end
  end
end
