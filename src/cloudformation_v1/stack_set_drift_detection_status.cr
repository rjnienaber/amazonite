private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum StackSetDriftDetectionStatus
    Completed
    Failed
    PartialSuccess
    InProgress
    Stopped

    def self.to_json(e : StackSetDriftDetectionStatus, json : JSON::Builder) : Nil
      value = case e
              when ACF::StackSetDriftDetectionStatus::Completed      then "COMPLETED"
              when ACF::StackSetDriftDetectionStatus::Failed         then "FAILED"
              when ACF::StackSetDriftDetectionStatus::PartialSuccess then "PARTIAL_SUCCESS"
              when ACF::StackSetDriftDetectionStatus::InProgress     then "IN_PROGRESS"
              when ACF::StackSetDriftDetectionStatus::Stopped        then "STOPPED"
              else
                raise Exception.new("unknown enum value for 'StackSetDriftDetectionStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::StackSetDriftDetectionStatus
      value = pull.read_string
      case value
      when "COMPLETED"       then ACF::StackSetDriftDetectionStatus::Completed
      when "FAILED"          then ACF::StackSetDriftDetectionStatus::Failed
      when "PARTIAL_SUCCESS" then ACF::StackSetDriftDetectionStatus::PartialSuccess
      when "IN_PROGRESS"     then ACF::StackSetDriftDetectionStatus::InProgress
      when "STOPPED"         then ACF::StackSetDriftDetectionStatus::Stopped
      else
        raise Exception.new("unknown enum value for 'StackSetDriftDetectionStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::StackSetDriftDetectionStatus::Completed      then "COMPLETED"
      when ACF::StackSetDriftDetectionStatus::Failed         then "FAILED"
      when ACF::StackSetDriftDetectionStatus::PartialSuccess then "PARTIAL_SUCCESS"
      when ACF::StackSetDriftDetectionStatus::InProgress     then "IN_PROGRESS"
      when ACF::StackSetDriftDetectionStatus::Stopped        then "STOPPED"
      else
        raise Exception.new("unknown enum value for 'StackSetDriftDetectionStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::StackSetDriftDetectionStatus?
      case key
      when "COMPLETED"       then ACF::StackSetDriftDetectionStatus::Completed
      when "FAILED"          then ACF::StackSetDriftDetectionStatus::Failed
      when "PARTIAL_SUCCESS" then ACF::StackSetDriftDetectionStatus::PartialSuccess
      when "IN_PROGRESS"     then ACF::StackSetDriftDetectionStatus::InProgress
      when "STOPPED"         then ACF::StackSetDriftDetectionStatus::Stopped
      else
        nil
      end
    end
  end
end
