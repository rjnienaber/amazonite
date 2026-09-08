private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum FleetReplacementStrategy
    Launch
    LaunchBeforeTerminate

    def self.to_json(e : FleetReplacementStrategy, json : JSON::Builder) : Nil
      value = case e
              when AEC::FleetReplacementStrategy::Launch                then "launch"
              when AEC::FleetReplacementStrategy::LaunchBeforeTerminate then "launch-before-terminate"
              else
                raise Exception.new("unknown enum value for 'FleetReplacementStrategy' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::FleetReplacementStrategy
      value = pull.read_string
      case value
      when "launch"                  then AEC::FleetReplacementStrategy::Launch
      when "launch-before-terminate" then AEC::FleetReplacementStrategy::LaunchBeforeTerminate
      else
        raise Exception.new("unknown enum value for 'FleetReplacementStrategy' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::FleetReplacementStrategy::Launch                then "launch"
      when AEC::FleetReplacementStrategy::LaunchBeforeTerminate then "launch-before-terminate"
      else
        raise Exception.new("unknown enum value for 'FleetReplacementStrategy' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::FleetReplacementStrategy?
      case key
      when "launch"                  then AEC::FleetReplacementStrategy::Launch
      when "launch-before-terminate" then AEC::FleetReplacementStrategy::LaunchBeforeTerminate
      else
        nil
      end
    end
  end
end
