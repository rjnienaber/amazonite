private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum SpotInstanceInterruptionBehavior
    Hibernate
    Stop
    Terminate

    def self.to_json(e : SpotInstanceInterruptionBehavior, json : JSON::Builder) : Nil
      value = case e
              when AEC::SpotInstanceInterruptionBehavior::Hibernate then "hibernate"
              when AEC::SpotInstanceInterruptionBehavior::Stop      then "stop"
              when AEC::SpotInstanceInterruptionBehavior::Terminate then "terminate"
              else
                raise Exception.new("unknown enum value for 'SpotInstanceInterruptionBehavior' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::SpotInstanceInterruptionBehavior
      value = pull.read_string
      case value
      when "hibernate" then AEC::SpotInstanceInterruptionBehavior::Hibernate
      when "stop"      then AEC::SpotInstanceInterruptionBehavior::Stop
      when "terminate" then AEC::SpotInstanceInterruptionBehavior::Terminate
      else
        raise Exception.new("unknown enum value for 'SpotInstanceInterruptionBehavior' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::SpotInstanceInterruptionBehavior::Hibernate then "hibernate"
      when AEC::SpotInstanceInterruptionBehavior::Stop      then "stop"
      when AEC::SpotInstanceInterruptionBehavior::Terminate then "terminate"
      else
        raise Exception.new("unknown enum value for 'SpotInstanceInterruptionBehavior' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::SpotInstanceInterruptionBehavior?
      case key
      when "hibernate" then AEC::SpotInstanceInterruptionBehavior::Hibernate
      when "stop"      then AEC::SpotInstanceInterruptionBehavior::Stop
      when "terminate" then AEC::SpotInstanceInterruptionBehavior::Terminate
      else
        nil
      end
    end
  end
end
