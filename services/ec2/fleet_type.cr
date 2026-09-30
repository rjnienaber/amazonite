private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum FleetType
    Request
    Maintain
    Instant

    def self.to_json(e : FleetType, json : JSON::Builder) : Nil
      value = case e
              when AEC::FleetType::Request  then "request"
              when AEC::FleetType::Maintain then "maintain"
              when AEC::FleetType::Instant  then "instant"
              else
                raise Exception.new("unknown enum value for 'FleetType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::FleetType
      value = pull.read_string
      case value
      when "request"  then AEC::FleetType::Request
      when "maintain" then AEC::FleetType::Maintain
      when "instant"  then AEC::FleetType::Instant
      else
        raise Exception.new("unknown enum value for 'FleetType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::FleetType::Request  then "request"
      when AEC::FleetType::Maintain then "maintain"
      when AEC::FleetType::Instant  then "instant"
      else
        raise Exception.new("unknown enum value for 'FleetType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::FleetType?
      case key
      when "request"  then AEC::FleetType::Request
      when "maintain" then AEC::FleetType::Maintain
      when "instant"  then AEC::FleetType::Instant
      else
        nil
      end
    end
  end
end
