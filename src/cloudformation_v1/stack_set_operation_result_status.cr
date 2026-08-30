private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum StackSetOperationResultStatus
    Pending
    Running
    Succeeded
    Failed
    Cancelled

    def self.to_json(e : StackSetOperationResultStatus, json : JSON::Builder) : Nil
      value = case e
              when ACF::StackSetOperationResultStatus::Pending   then "PENDING"
              when ACF::StackSetOperationResultStatus::Running   then "RUNNING"
              when ACF::StackSetOperationResultStatus::Succeeded then "SUCCEEDED"
              when ACF::StackSetOperationResultStatus::Failed    then "FAILED"
              when ACF::StackSetOperationResultStatus::Cancelled then "CANCELLED"
              else
                raise Exception.new("unknown enum value for 'StackSetOperationResultStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::StackSetOperationResultStatus
      value = pull.read_string
      case value
      when "PENDING"   then ACF::StackSetOperationResultStatus::Pending
      when "RUNNING"   then ACF::StackSetOperationResultStatus::Running
      when "SUCCEEDED" then ACF::StackSetOperationResultStatus::Succeeded
      when "FAILED"    then ACF::StackSetOperationResultStatus::Failed
      when "CANCELLED" then ACF::StackSetOperationResultStatus::Cancelled
      else
        raise Exception.new("unknown enum value for 'StackSetOperationResultStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::StackSetOperationResultStatus::Pending   then "PENDING"
      when ACF::StackSetOperationResultStatus::Running   then "RUNNING"
      when ACF::StackSetOperationResultStatus::Succeeded then "SUCCEEDED"
      when ACF::StackSetOperationResultStatus::Failed    then "FAILED"
      when ACF::StackSetOperationResultStatus::Cancelled then "CANCELLED"
      else
        raise Exception.new("unknown enum value for 'StackSetOperationResultStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::StackSetOperationResultStatus?
      case key
      when "PENDING"   then ACF::StackSetOperationResultStatus::Pending
      when "RUNNING"   then ACF::StackSetOperationResultStatus::Running
      when "SUCCEEDED" then ACF::StackSetOperationResultStatus::Succeeded
      when "FAILED"    then ACF::StackSetOperationResultStatus::Failed
      when "CANCELLED" then ACF::StackSetOperationResultStatus::Cancelled
      else
        nil
      end
    end
  end
end
