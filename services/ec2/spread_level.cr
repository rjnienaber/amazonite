private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum SpreadLevel
    Host
    Rack

    def self.to_json(e : SpreadLevel, json : JSON::Builder) : Nil
      value = case e
              when AEC::SpreadLevel::Host then "host"
              when AEC::SpreadLevel::Rack then "rack"
              else
                raise Exception.new("unknown enum value for 'SpreadLevel' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::SpreadLevel
      value = pull.read_string
      case value
      when "host" then AEC::SpreadLevel::Host
      when "rack" then AEC::SpreadLevel::Rack
      else
        raise Exception.new("unknown enum value for 'SpreadLevel' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::SpreadLevel::Host then "host"
      when AEC::SpreadLevel::Rack then "rack"
      else
        raise Exception.new("unknown enum value for 'SpreadLevel' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::SpreadLevel?
      case key
      when "host" then AEC::SpreadLevel::Host
      when "rack" then AEC::SpreadLevel::Rack
      else
        nil
      end
    end
  end
end
