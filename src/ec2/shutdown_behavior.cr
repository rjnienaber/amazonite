private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ShutdownBehavior
    Stop
    Terminate

    def self.to_json(e : ShutdownBehavior, json : JSON::Builder) : Nil
      value = case e
              when AEC::ShutdownBehavior::Stop      then "stop"
              when AEC::ShutdownBehavior::Terminate then "terminate"
              else
                raise Exception.new("unknown enum value for 'ShutdownBehavior' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ShutdownBehavior
      value = pull.read_string
      case value
      when "stop"      then AEC::ShutdownBehavior::Stop
      when "terminate" then AEC::ShutdownBehavior::Terminate
      else
        raise Exception.new("unknown enum value for 'ShutdownBehavior' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ShutdownBehavior::Stop      then "stop"
      when AEC::ShutdownBehavior::Terminate then "terminate"
      else
        raise Exception.new("unknown enum value for 'ShutdownBehavior' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ShutdownBehavior?
      case key
      when "stop"      then AEC::ShutdownBehavior::Stop
      when "terminate" then AEC::ShutdownBehavior::Terminate
      else
        nil
      end
    end
  end
end
