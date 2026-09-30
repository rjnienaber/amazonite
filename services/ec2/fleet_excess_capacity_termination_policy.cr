private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum FleetExcessCapacityTerminationPolicy
    NoTermination
    Termination

    def self.to_json(e : FleetExcessCapacityTerminationPolicy, json : JSON::Builder) : Nil
      value = case e
              when AEC::FleetExcessCapacityTerminationPolicy::NoTermination then "no-termination"
              when AEC::FleetExcessCapacityTerminationPolicy::Termination   then "termination"
              else
                raise Exception.new("unknown enum value for 'FleetExcessCapacityTerminationPolicy' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::FleetExcessCapacityTerminationPolicy
      value = pull.read_string
      case value
      when "no-termination" then AEC::FleetExcessCapacityTerminationPolicy::NoTermination
      when "termination"    then AEC::FleetExcessCapacityTerminationPolicy::Termination
      else
        raise Exception.new("unknown enum value for 'FleetExcessCapacityTerminationPolicy' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::FleetExcessCapacityTerminationPolicy::NoTermination then "no-termination"
      when AEC::FleetExcessCapacityTerminationPolicy::Termination   then "termination"
      else
        raise Exception.new("unknown enum value for 'FleetExcessCapacityTerminationPolicy' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::FleetExcessCapacityTerminationPolicy?
      case key
      when "no-termination" then AEC::FleetExcessCapacityTerminationPolicy::NoTermination
      when "termination"    then AEC::FleetExcessCapacityTerminationPolicy::Termination
      else
        nil
      end
    end
  end
end
