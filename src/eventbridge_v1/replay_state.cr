private alias AEB = Amazonite::EventBridgeV1

module Amazonite::EventBridgeV1
  enum ReplayState
    Starting
    Running
    Cancelling
    Completed
    Cancelled
    Failed

    def self.to_json(e : ReplayState, json : JSON::Builder) : Nil
      value = case e
              when AEB::ReplayState::Starting   then "STARTING"
              when AEB::ReplayState::Running    then "RUNNING"
              when AEB::ReplayState::Cancelling then "CANCELLING"
              when AEB::ReplayState::Completed  then "COMPLETED"
              when AEB::ReplayState::Cancelled  then "CANCELLED"
              when AEB::ReplayState::Failed     then "FAILED"
              else
                raise Exception.new("unknown enum value for 'ReplayState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEB::ReplayState
      value = pull.read_string
      case value
      when "STARTING"   then AEB::ReplayState::Starting
      when "RUNNING"    then AEB::ReplayState::Running
      when "CANCELLING" then AEB::ReplayState::Cancelling
      when "COMPLETED"  then AEB::ReplayState::Completed
      when "CANCELLED"  then AEB::ReplayState::Cancelled
      when "FAILED"     then AEB::ReplayState::Failed
      else
        raise Exception.new("unknown enum value for 'ReplayState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEB::ReplayState::Starting   then "STARTING"
      when AEB::ReplayState::Running    then "RUNNING"
      when AEB::ReplayState::Cancelling then "CANCELLING"
      when AEB::ReplayState::Completed  then "COMPLETED"
      when AEB::ReplayState::Cancelled  then "CANCELLED"
      when AEB::ReplayState::Failed     then "FAILED"
      else
        raise Exception.new("unknown enum value for 'ReplayState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEB::ReplayState?
      case key
      when "STARTING"   then AEB::ReplayState::Starting
      when "RUNNING"    then AEB::ReplayState::Running
      when "CANCELLING" then AEB::ReplayState::Cancelling
      when "COMPLETED"  then AEB::ReplayState::Completed
      when "CANCELLED"  then AEB::ReplayState::Cancelled
      when "FAILED"     then AEB::ReplayState::Failed
      else
        nil
      end
    end
  end
end
