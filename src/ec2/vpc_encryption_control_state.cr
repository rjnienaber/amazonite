private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum VpcEncryptionControlState
    EnforceInProgress
    MonitorInProgress
    EnforceFailed
    MonitorFailed
    Deleting
    Deleted
    Available
    Creating
    DeleteFailed

    def self.to_json(e : VpcEncryptionControlState, json : JSON::Builder) : Nil
      value = case e
              when AEC::VpcEncryptionControlState::EnforceInProgress then "enforce-in-progress"
              when AEC::VpcEncryptionControlState::MonitorInProgress then "monitor-in-progress"
              when AEC::VpcEncryptionControlState::EnforceFailed     then "enforce-failed"
              when AEC::VpcEncryptionControlState::MonitorFailed     then "monitor-failed"
              when AEC::VpcEncryptionControlState::Deleting          then "deleting"
              when AEC::VpcEncryptionControlState::Deleted           then "deleted"
              when AEC::VpcEncryptionControlState::Available         then "available"
              when AEC::VpcEncryptionControlState::Creating          then "creating"
              when AEC::VpcEncryptionControlState::DeleteFailed      then "delete-failed"
              else
                raise Exception.new("unknown enum value for 'VpcEncryptionControlState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::VpcEncryptionControlState
      value = pull.read_string
      case value
      when "enforce-in-progress" then AEC::VpcEncryptionControlState::EnforceInProgress
      when "monitor-in-progress" then AEC::VpcEncryptionControlState::MonitorInProgress
      when "enforce-failed"      then AEC::VpcEncryptionControlState::EnforceFailed
      when "monitor-failed"      then AEC::VpcEncryptionControlState::MonitorFailed
      when "deleting"            then AEC::VpcEncryptionControlState::Deleting
      when "deleted"             then AEC::VpcEncryptionControlState::Deleted
      when "available"           then AEC::VpcEncryptionControlState::Available
      when "creating"            then AEC::VpcEncryptionControlState::Creating
      when "delete-failed"       then AEC::VpcEncryptionControlState::DeleteFailed
      else
        raise Exception.new("unknown enum value for 'VpcEncryptionControlState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::VpcEncryptionControlState::EnforceInProgress then "enforce-in-progress"
      when AEC::VpcEncryptionControlState::MonitorInProgress then "monitor-in-progress"
      when AEC::VpcEncryptionControlState::EnforceFailed     then "enforce-failed"
      when AEC::VpcEncryptionControlState::MonitorFailed     then "monitor-failed"
      when AEC::VpcEncryptionControlState::Deleting          then "deleting"
      when AEC::VpcEncryptionControlState::Deleted           then "deleted"
      when AEC::VpcEncryptionControlState::Available         then "available"
      when AEC::VpcEncryptionControlState::Creating          then "creating"
      when AEC::VpcEncryptionControlState::DeleteFailed      then "delete-failed"
      else
        raise Exception.new("unknown enum value for 'VpcEncryptionControlState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::VpcEncryptionControlState?
      case key
      when "enforce-in-progress" then AEC::VpcEncryptionControlState::EnforceInProgress
      when "monitor-in-progress" then AEC::VpcEncryptionControlState::MonitorInProgress
      when "enforce-failed"      then AEC::VpcEncryptionControlState::EnforceFailed
      when "monitor-failed"      then AEC::VpcEncryptionControlState::MonitorFailed
      when "deleting"            then AEC::VpcEncryptionControlState::Deleting
      when "deleted"             then AEC::VpcEncryptionControlState::Deleted
      when "available"           then AEC::VpcEncryptionControlState::Available
      when "creating"            then AEC::VpcEncryptionControlState::Creating
      when "delete-failed"       then AEC::VpcEncryptionControlState::DeleteFailed
      else
        nil
      end
    end
  end
end
