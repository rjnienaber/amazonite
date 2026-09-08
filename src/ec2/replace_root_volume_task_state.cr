private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ReplaceRootVolumeTaskState
    Pending
    InProgress
    Failing
    Succeeded
    Failed
    FailedDetached

    def self.to_json(e : ReplaceRootVolumeTaskState, json : JSON::Builder) : Nil
      value = case e
              when AEC::ReplaceRootVolumeTaskState::Pending        then "pending"
              when AEC::ReplaceRootVolumeTaskState::InProgress     then "in-progress"
              when AEC::ReplaceRootVolumeTaskState::Failing        then "failing"
              when AEC::ReplaceRootVolumeTaskState::Succeeded      then "succeeded"
              when AEC::ReplaceRootVolumeTaskState::Failed         then "failed"
              when AEC::ReplaceRootVolumeTaskState::FailedDetached then "failed-detached"
              else
                raise Exception.new("unknown enum value for 'ReplaceRootVolumeTaskState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ReplaceRootVolumeTaskState
      value = pull.read_string
      case value
      when "pending"         then AEC::ReplaceRootVolumeTaskState::Pending
      when "in-progress"     then AEC::ReplaceRootVolumeTaskState::InProgress
      when "failing"         then AEC::ReplaceRootVolumeTaskState::Failing
      when "succeeded"       then AEC::ReplaceRootVolumeTaskState::Succeeded
      when "failed"          then AEC::ReplaceRootVolumeTaskState::Failed
      when "failed-detached" then AEC::ReplaceRootVolumeTaskState::FailedDetached
      else
        raise Exception.new("unknown enum value for 'ReplaceRootVolumeTaskState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ReplaceRootVolumeTaskState::Pending        then "pending"
      when AEC::ReplaceRootVolumeTaskState::InProgress     then "in-progress"
      when AEC::ReplaceRootVolumeTaskState::Failing        then "failing"
      when AEC::ReplaceRootVolumeTaskState::Succeeded      then "succeeded"
      when AEC::ReplaceRootVolumeTaskState::Failed         then "failed"
      when AEC::ReplaceRootVolumeTaskState::FailedDetached then "failed-detached"
      else
        raise Exception.new("unknown enum value for 'ReplaceRootVolumeTaskState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ReplaceRootVolumeTaskState?
      case key
      when "pending"         then AEC::ReplaceRootVolumeTaskState::Pending
      when "in-progress"     then AEC::ReplaceRootVolumeTaskState::InProgress
      when "failing"         then AEC::ReplaceRootVolumeTaskState::Failing
      when "succeeded"       then AEC::ReplaceRootVolumeTaskState::Succeeded
      when "failed"          then AEC::ReplaceRootVolumeTaskState::Failed
      when "failed-detached" then AEC::ReplaceRootVolumeTaskState::FailedDetached
      else
        nil
      end
    end
  end
end
