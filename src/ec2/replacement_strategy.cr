private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ReplacementStrategy
    Launch
    LaunchBeforeTerminate

    def self.to_json(e : ReplacementStrategy, json : JSON::Builder) : Nil
      value = case e
              when AEC::ReplacementStrategy::Launch                then "launch"
              when AEC::ReplacementStrategy::LaunchBeforeTerminate then "launch-before-terminate"
              else
                raise Exception.new("unknown enum value for 'ReplacementStrategy' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ReplacementStrategy
      value = pull.read_string
      case value
      when "launch"                  then AEC::ReplacementStrategy::Launch
      when "launch-before-terminate" then AEC::ReplacementStrategy::LaunchBeforeTerminate
      else
        raise Exception.new("unknown enum value for 'ReplacementStrategy' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ReplacementStrategy::Launch                then "launch"
      when AEC::ReplacementStrategy::LaunchBeforeTerminate then "launch-before-terminate"
      else
        raise Exception.new("unknown enum value for 'ReplacementStrategy' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ReplacementStrategy?
      case key
      when "launch"                  then AEC::ReplacementStrategy::Launch
      when "launch-before-terminate" then AEC::ReplacementStrategy::LaunchBeforeTerminate
      else
        nil
      end
    end
  end
end
