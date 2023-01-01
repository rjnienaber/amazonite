private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum PlatformType
    Windows
    Linux
    MacOs

    def self.to_json(e : PlatformType, json : JSON::Builder) : Nil
      value = case e
              when AS::PlatformType::Windows then "Windows"
              when AS::PlatformType::Linux   then "Linux"
              when AS::PlatformType::MacOs   then "MacOS"
              else
                raise Exception.new("unknown enum value for 'PlatformType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::PlatformType
      value = pull.read_string
      case value
      when "Windows" then AS::PlatformType::Windows
      when "Linux"   then AS::PlatformType::Linux
      when "MacOS"   then AS::PlatformType::MacOs
      else
        raise Exception.new("unknown enum value for 'PlatformType' when deserializing from json: '#{value}'")
      end
    end
  end
end
