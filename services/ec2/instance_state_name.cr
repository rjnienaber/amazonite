private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum InstanceStateName
    Pending
    Running
    ShuttingDown
    Terminated
    Stopping
    Stopped

    def self.to_json(e : InstanceStateName, json : JSON::Builder) : Nil
      value = case e
              when AEC::InstanceStateName::Pending      then "pending"
              when AEC::InstanceStateName::Running      then "running"
              when AEC::InstanceStateName::ShuttingDown then "shutting-down"
              when AEC::InstanceStateName::Terminated   then "terminated"
              when AEC::InstanceStateName::Stopping     then "stopping"
              when AEC::InstanceStateName::Stopped      then "stopped"
              else
                raise Exception.new("unknown enum value for 'InstanceStateName' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::InstanceStateName
      value = pull.read_string
      case value
      when "pending"       then AEC::InstanceStateName::Pending
      when "running"       then AEC::InstanceStateName::Running
      when "shutting-down" then AEC::InstanceStateName::ShuttingDown
      when "terminated"    then AEC::InstanceStateName::Terminated
      when "stopping"      then AEC::InstanceStateName::Stopping
      when "stopped"       then AEC::InstanceStateName::Stopped
      else
        raise Exception.new("unknown enum value for 'InstanceStateName' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::InstanceStateName::Pending      then "pending"
      when AEC::InstanceStateName::Running      then "running"
      when AEC::InstanceStateName::ShuttingDown then "shutting-down"
      when AEC::InstanceStateName::Terminated   then "terminated"
      when AEC::InstanceStateName::Stopping     then "stopping"
      when AEC::InstanceStateName::Stopped      then "stopped"
      else
        raise Exception.new("unknown enum value for 'InstanceStateName' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::InstanceStateName?
      case key
      when "pending"       then AEC::InstanceStateName::Pending
      when "running"       then AEC::InstanceStateName::Running
      when "shutting-down" then AEC::InstanceStateName::ShuttingDown
      when "terminated"    then AEC::InstanceStateName::Terminated
      when "stopping"      then AEC::InstanceStateName::Stopping
      when "stopped"       then AEC::InstanceStateName::Stopped
      else
        nil
      end
    end
  end
end
