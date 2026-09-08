private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum FleetInstanceMatchCriteria
    Open

    def self.to_json(e : FleetInstanceMatchCriteria, json : JSON::Builder) : Nil
      value = case e
              when AEC::FleetInstanceMatchCriteria::Open then "open"
              else
                raise Exception.new("unknown enum value for 'FleetInstanceMatchCriteria' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::FleetInstanceMatchCriteria
      value = pull.read_string
      case value
      when "open" then AEC::FleetInstanceMatchCriteria::Open
      else
        raise Exception.new("unknown enum value for 'FleetInstanceMatchCriteria' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::FleetInstanceMatchCriteria::Open then "open"
      else
        raise Exception.new("unknown enum value for 'FleetInstanceMatchCriteria' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::FleetInstanceMatchCriteria?
      case key
      when "open" then AEC::FleetInstanceMatchCriteria::Open
      else
        nil
      end
    end
  end
end
