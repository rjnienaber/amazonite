private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum Schedule
    Hourly

    def self.to_json(e : Schedule, json : JSON::Builder) : Nil
      value = case e
              when AEC::Schedule::Hourly then "hourly"
              else
                raise Exception.new("unknown enum value for 'Schedule' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::Schedule
      value = pull.read_string
      case value
      when "hourly" then AEC::Schedule::Hourly
      else
        raise Exception.new("unknown enum value for 'Schedule' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::Schedule::Hourly then "hourly"
      else
        raise Exception.new("unknown enum value for 'Schedule' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::Schedule?
      case key
      when "hourly" then AEC::Schedule::Hourly
      else
        nil
      end
    end
  end
end
