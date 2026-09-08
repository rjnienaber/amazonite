private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum AccountAttributeName
    SupportedPlatforms
    DefaultVpc

    def self.to_json(e : AccountAttributeName, json : JSON::Builder) : Nil
      value = case e
              when AEC::AccountAttributeName::SupportedPlatforms then "supported-platforms"
              when AEC::AccountAttributeName::DefaultVpc         then "default-vpc"
              else
                raise Exception.new("unknown enum value for 'AccountAttributeName' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::AccountAttributeName
      value = pull.read_string
      case value
      when "supported-platforms" then AEC::AccountAttributeName::SupportedPlatforms
      when "default-vpc"         then AEC::AccountAttributeName::DefaultVpc
      else
        raise Exception.new("unknown enum value for 'AccountAttributeName' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::AccountAttributeName::SupportedPlatforms then "supported-platforms"
      when AEC::AccountAttributeName::DefaultVpc         then "default-vpc"
      else
        raise Exception.new("unknown enum value for 'AccountAttributeName' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::AccountAttributeName?
      case key
      when "supported-platforms" then AEC::AccountAttributeName::SupportedPlatforms
      when "default-vpc"         then AEC::AccountAttributeName::DefaultVpc
      else
        nil
      end
    end
  end
end
