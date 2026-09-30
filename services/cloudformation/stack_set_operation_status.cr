private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum StackSetOperationStatus
    Running
    Succeeded
    Failed
    Stopping
    Stopped
    Queued

    def self.to_json(e : StackSetOperationStatus, json : JSON::Builder) : Nil
      value = case e
              when ACF::StackSetOperationStatus::Running   then "RUNNING"
              when ACF::StackSetOperationStatus::Succeeded then "SUCCEEDED"
              when ACF::StackSetOperationStatus::Failed    then "FAILED"
              when ACF::StackSetOperationStatus::Stopping  then "STOPPING"
              when ACF::StackSetOperationStatus::Stopped   then "STOPPED"
              when ACF::StackSetOperationStatus::Queued    then "QUEUED"
              else
                raise Exception.new("unknown enum value for 'StackSetOperationStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::StackSetOperationStatus
      value = pull.read_string
      case value
      when "RUNNING"   then ACF::StackSetOperationStatus::Running
      when "SUCCEEDED" then ACF::StackSetOperationStatus::Succeeded
      when "FAILED"    then ACF::StackSetOperationStatus::Failed
      when "STOPPING"  then ACF::StackSetOperationStatus::Stopping
      when "STOPPED"   then ACF::StackSetOperationStatus::Stopped
      when "QUEUED"    then ACF::StackSetOperationStatus::Queued
      else
        raise Exception.new("unknown enum value for 'StackSetOperationStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::StackSetOperationStatus::Running   then "RUNNING"
      when ACF::StackSetOperationStatus::Succeeded then "SUCCEEDED"
      when ACF::StackSetOperationStatus::Failed    then "FAILED"
      when ACF::StackSetOperationStatus::Stopping  then "STOPPING"
      when ACF::StackSetOperationStatus::Stopped   then "STOPPED"
      when ACF::StackSetOperationStatus::Queued    then "QUEUED"
      else
        raise Exception.new("unknown enum value for 'StackSetOperationStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::StackSetOperationStatus?
      case key
      when "RUNNING"   then ACF::StackSetOperationStatus::Running
      when "SUCCEEDED" then ACF::StackSetOperationStatus::Succeeded
      when "FAILED"    then ACF::StackSetOperationStatus::Failed
      when "STOPPING"  then ACF::StackSetOperationStatus::Stopping
      when "STOPPED"   then ACF::StackSetOperationStatus::Stopped
      when "QUEUED"    then ACF::StackSetOperationStatus::Queued
      else
        nil
      end
    end
  end
end
