private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum PlatformValues
    Windows

    def self.to_json(e : PlatformValues, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::PlatformValues
      value = pull.read_string
      case value
      when "Windows" then AEC::PlatformValues::Windows
      else
        raise Exception.new("unknown enum value for 'PlatformValues' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AEC::PlatformValues?
      case key
      when "Windows" then AEC::PlatformValues::Windows
      else
        nil
      end
    end
  end
end
