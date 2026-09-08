private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum InstanceInterruptionBehavior
    Hibernate
    Stop
    Terminate

    def self.to_json(e : InstanceInterruptionBehavior, json : JSON::Builder) : Nil
      value = case e
              when AEC::InstanceInterruptionBehavior::Hibernate then "hibernate"
              when AEC::InstanceInterruptionBehavior::Stop      then "stop"
              when AEC::InstanceInterruptionBehavior::Terminate then "terminate"
              else
                raise Exception.new("unknown enum value for 'InstanceInterruptionBehavior' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::InstanceInterruptionBehavior
      value = pull.read_string
      case value
      when "hibernate" then AEC::InstanceInterruptionBehavior::Hibernate
      when "stop"      then AEC::InstanceInterruptionBehavior::Stop
      when "terminate" then AEC::InstanceInterruptionBehavior::Terminate
      else
        raise Exception.new("unknown enum value for 'InstanceInterruptionBehavior' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::InstanceInterruptionBehavior::Hibernate then "hibernate"
      when AEC::InstanceInterruptionBehavior::Stop      then "stop"
      when AEC::InstanceInterruptionBehavior::Terminate then "terminate"
      else
        raise Exception.new("unknown enum value for 'InstanceInterruptionBehavior' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::InstanceInterruptionBehavior?
      case key
      when "hibernate" then AEC::InstanceInterruptionBehavior::Hibernate
      when "stop"      then AEC::InstanceInterruptionBehavior::Stop
      when "terminate" then AEC::InstanceInterruptionBehavior::Terminate
      else
        nil
      end
    end
  end
end
