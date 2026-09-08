private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum AssociatedNetworkType
    Vpc

    def self.to_json(e : AssociatedNetworkType, json : JSON::Builder) : Nil
      value = case e
              when AEC::AssociatedNetworkType::Vpc then "vpc"
              else
                raise Exception.new("unknown enum value for 'AssociatedNetworkType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::AssociatedNetworkType
      value = pull.read_string
      case value
      when "vpc" then AEC::AssociatedNetworkType::Vpc
      else
        raise Exception.new("unknown enum value for 'AssociatedNetworkType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::AssociatedNetworkType::Vpc then "vpc"
      else
        raise Exception.new("unknown enum value for 'AssociatedNetworkType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::AssociatedNetworkType?
      case key
      when "vpc" then AEC::AssociatedNetworkType::Vpc
      else
        nil
      end
    end
  end
end
