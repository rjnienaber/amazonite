private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ExcessCapacityTerminationPolicy
    NoTermination
    Default

    def self.to_json(e : ExcessCapacityTerminationPolicy, json : JSON::Builder) : Nil
      value = case e
              when AEC::ExcessCapacityTerminationPolicy::NoTermination then "noTermination"
              when AEC::ExcessCapacityTerminationPolicy::Default       then "default"
              else
                raise Exception.new("unknown enum value for 'ExcessCapacityTerminationPolicy' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ExcessCapacityTerminationPolicy
      value = pull.read_string
      case value
      when "noTermination" then AEC::ExcessCapacityTerminationPolicy::NoTermination
      when "default"       then AEC::ExcessCapacityTerminationPolicy::Default
      else
        raise Exception.new("unknown enum value for 'ExcessCapacityTerminationPolicy' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ExcessCapacityTerminationPolicy::NoTermination then "noTermination"
      when AEC::ExcessCapacityTerminationPolicy::Default       then "default"
      else
        raise Exception.new("unknown enum value for 'ExcessCapacityTerminationPolicy' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ExcessCapacityTerminationPolicy?
      case key
      when "noTermination" then AEC::ExcessCapacityTerminationPolicy::NoTermination
      when "default"       then AEC::ExcessCapacityTerminationPolicy::Default
      else
        nil
      end
    end
  end
end
