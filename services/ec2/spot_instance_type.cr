private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum SpotInstanceType
    OneTime
    Persistent

    def self.to_json(e : SpotInstanceType, json : JSON::Builder) : Nil
      value = case e
              when AEC::SpotInstanceType::OneTime    then "one-time"
              when AEC::SpotInstanceType::Persistent then "persistent"
              else
                raise Exception.new("unknown enum value for 'SpotInstanceType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::SpotInstanceType
      value = pull.read_string
      case value
      when "one-time"   then AEC::SpotInstanceType::OneTime
      when "persistent" then AEC::SpotInstanceType::Persistent
      else
        raise Exception.new("unknown enum value for 'SpotInstanceType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::SpotInstanceType::OneTime    then "one-time"
      when AEC::SpotInstanceType::Persistent then "persistent"
      else
        raise Exception.new("unknown enum value for 'SpotInstanceType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::SpotInstanceType?
      case key
      when "one-time"   then AEC::SpotInstanceType::OneTime
      when "persistent" then AEC::SpotInstanceType::Persistent
      else
        nil
      end
    end
  end
end
