module Amazonite::Core
  class StringUtils
    def self.to_bool(value : String | Nil)
      return false if value.nil?
      /t(rue)?/i.matches?(value)
    end
  end
end