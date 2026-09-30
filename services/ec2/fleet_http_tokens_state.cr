private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum FleetHttpTokensState
    Optional
    Required

    def self.to_json(e : FleetHttpTokensState, json : JSON::Builder) : Nil
      value = case e
              when AEC::FleetHttpTokensState::Optional then "optional"
              when AEC::FleetHttpTokensState::Required then "required"
              else
                raise Exception.new("unknown enum value for 'FleetHttpTokensState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::FleetHttpTokensState
      value = pull.read_string
      case value
      when "optional" then AEC::FleetHttpTokensState::Optional
      when "required" then AEC::FleetHttpTokensState::Required
      else
        raise Exception.new("unknown enum value for 'FleetHttpTokensState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::FleetHttpTokensState::Optional then "optional"
      when AEC::FleetHttpTokensState::Required then "required"
      else
        raise Exception.new("unknown enum value for 'FleetHttpTokensState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::FleetHttpTokensState?
      case key
      when "optional" then AEC::FleetHttpTokensState::Optional
      when "required" then AEC::FleetHttpTokensState::Required
      else
        nil
      end
    end
  end
end
