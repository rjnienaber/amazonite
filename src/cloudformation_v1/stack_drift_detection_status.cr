private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum StackDriftDetectionStatus
    DetectionInProgress
    DetectionFailed
    DetectionComplete

    def self.to_json(e : StackDriftDetectionStatus, json : JSON::Builder) : Nil
      value = case e
              when ACF::StackDriftDetectionStatus::DetectionInProgress then "DETECTION_IN_PROGRESS"
              when ACF::StackDriftDetectionStatus::DetectionFailed     then "DETECTION_FAILED"
              when ACF::StackDriftDetectionStatus::DetectionComplete   then "DETECTION_COMPLETE"
              else
                raise Exception.new("unknown enum value for 'StackDriftDetectionStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::StackDriftDetectionStatus
      value = pull.read_string
      case value
      when "DETECTION_IN_PROGRESS" then ACF::StackDriftDetectionStatus::DetectionInProgress
      when "DETECTION_FAILED"      then ACF::StackDriftDetectionStatus::DetectionFailed
      when "DETECTION_COMPLETE"    then ACF::StackDriftDetectionStatus::DetectionComplete
      else
        raise Exception.new("unknown enum value for 'StackDriftDetectionStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::StackDriftDetectionStatus::DetectionInProgress then "DETECTION_IN_PROGRESS"
      when ACF::StackDriftDetectionStatus::DetectionFailed     then "DETECTION_FAILED"
      when ACF::StackDriftDetectionStatus::DetectionComplete   then "DETECTION_COMPLETE"
      else
        raise Exception.new("unknown enum value for 'StackDriftDetectionStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::StackDriftDetectionStatus?
      case key
      when "DETECTION_IN_PROGRESS" then ACF::StackDriftDetectionStatus::DetectionInProgress
      when "DETECTION_FAILED"      then ACF::StackDriftDetectionStatus::DetectionFailed
      when "DETECTION_COMPLETE"    then ACF::StackDriftDetectionStatus::DetectionComplete
      else
        nil
      end
    end
  end
end
