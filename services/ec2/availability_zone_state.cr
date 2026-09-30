private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum AvailabilityZoneState
    Available
    Information
    Impaired
    Unavailable
    Constrained

    def self.to_json(e : AvailabilityZoneState, json : JSON::Builder) : Nil
      value = case e
              when AEC::AvailabilityZoneState::Available   then "available"
              when AEC::AvailabilityZoneState::Information then "information"
              when AEC::AvailabilityZoneState::Impaired    then "impaired"
              when AEC::AvailabilityZoneState::Unavailable then "unavailable"
              when AEC::AvailabilityZoneState::Constrained then "constrained"
              else
                raise Exception.new("unknown enum value for 'AvailabilityZoneState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::AvailabilityZoneState
      value = pull.read_string
      case value
      when "available"   then AEC::AvailabilityZoneState::Available
      when "information" then AEC::AvailabilityZoneState::Information
      when "impaired"    then AEC::AvailabilityZoneState::Impaired
      when "unavailable" then AEC::AvailabilityZoneState::Unavailable
      when "constrained" then AEC::AvailabilityZoneState::Constrained
      else
        raise Exception.new("unknown enum value for 'AvailabilityZoneState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::AvailabilityZoneState::Available   then "available"
      when AEC::AvailabilityZoneState::Information then "information"
      when AEC::AvailabilityZoneState::Impaired    then "impaired"
      when AEC::AvailabilityZoneState::Unavailable then "unavailable"
      when AEC::AvailabilityZoneState::Constrained then "constrained"
      else
        raise Exception.new("unknown enum value for 'AvailabilityZoneState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::AvailabilityZoneState?
      case key
      when "available"   then AEC::AvailabilityZoneState::Available
      when "information" then AEC::AvailabilityZoneState::Information
      when "impaired"    then AEC::AvailabilityZoneState::Impaired
      when "unavailable" then AEC::AvailabilityZoneState::Unavailable
      when "constrained" then AEC::AvailabilityZoneState::Constrained
      else
        nil
      end
    end
  end
end
