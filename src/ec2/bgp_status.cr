private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum BgpStatus
    Up
    Down

    def self.to_json(e : BgpStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::BgpStatus::Up   then "up"
              when AEC::BgpStatus::Down then "down"
              else
                raise Exception.new("unknown enum value for 'BgpStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::BgpStatus
      value = pull.read_string
      case value
      when "up"   then AEC::BgpStatus::Up
      when "down" then AEC::BgpStatus::Down
      else
        raise Exception.new("unknown enum value for 'BgpStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::BgpStatus::Up   then "up"
      when AEC::BgpStatus::Down then "down"
      else
        raise Exception.new("unknown enum value for 'BgpStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::BgpStatus?
      case key
      when "up"   then AEC::BgpStatus::Up
      when "down" then AEC::BgpStatus::Down
      else
        nil
      end
    end
  end
end
