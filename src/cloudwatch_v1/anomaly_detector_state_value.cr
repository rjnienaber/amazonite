private alias ACW = Amazonite::CloudWatchV1

module Amazonite::CloudWatchV1
  enum AnomalyDetectorStateValue
    PendingTraining
    TrainedInsufficientData
    Trained

    def self.to_json(e : AnomalyDetectorStateValue, json : JSON::Builder) : Nil
      value = case e
              when ACW::AnomalyDetectorStateValue::PendingTraining         then "PENDING_TRAINING"
              when ACW::AnomalyDetectorStateValue::TrainedInsufficientData then "TRAINED_INSUFFICIENT_DATA"
              when ACW::AnomalyDetectorStateValue::Trained                 then "TRAINED"
              else
                raise Exception.new("unknown enum value for 'AnomalyDetectorStateValue' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACW::AnomalyDetectorStateValue
      value = pull.read_string
      case value
      when "PENDING_TRAINING"          then ACW::AnomalyDetectorStateValue::PendingTraining
      when "TRAINED_INSUFFICIENT_DATA" then ACW::AnomalyDetectorStateValue::TrainedInsufficientData
      when "TRAINED"                   then ACW::AnomalyDetectorStateValue::Trained
      else
        raise Exception.new("unknown enum value for 'AnomalyDetectorStateValue' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACW::AnomalyDetectorStateValue::PendingTraining         then "PENDING_TRAINING"
      when ACW::AnomalyDetectorStateValue::TrainedInsufficientData then "TRAINED_INSUFFICIENT_DATA"
      when ACW::AnomalyDetectorStateValue::Trained                 then "TRAINED"
      else
        raise Exception.new("unknown enum value for 'AnomalyDetectorStateValue' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACW::AnomalyDetectorStateValue?
      case key
      when "PENDING_TRAINING"          then ACW::AnomalyDetectorStateValue::PendingTraining
      when "TRAINED_INSUFFICIENT_DATA" then ACW::AnomalyDetectorStateValue::TrainedInsufficientData
      when "TRAINED"                   then ACW::AnomalyDetectorStateValue::Trained
      else
        nil
      end
    end
  end
end
