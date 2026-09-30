private alias ACWL = Amazonite::CloudWatchLogs

module Amazonite::CloudWatchLogs
  enum AnomalyDetectorStatus
    Initializing
    Training
    Analyzing
    Failed
    Deleted
    Paused

    def self.to_json(e : AnomalyDetectorStatus, json : JSON::Builder) : Nil
      value = case e
              when ACWL::AnomalyDetectorStatus::Initializing then "INITIALIZING"
              when ACWL::AnomalyDetectorStatus::Training     then "TRAINING"
              when ACWL::AnomalyDetectorStatus::Analyzing    then "ANALYZING"
              when ACWL::AnomalyDetectorStatus::Failed       then "FAILED"
              when ACWL::AnomalyDetectorStatus::Deleted      then "DELETED"
              when ACWL::AnomalyDetectorStatus::Paused       then "PAUSED"
              else
                raise Exception.new("unknown enum value for 'AnomalyDetectorStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::AnomalyDetectorStatus
      value = pull.read_string
      case value
      when "INITIALIZING" then ACWL::AnomalyDetectorStatus::Initializing
      when "TRAINING"     then ACWL::AnomalyDetectorStatus::Training
      when "ANALYZING"    then ACWL::AnomalyDetectorStatus::Analyzing
      when "FAILED"       then ACWL::AnomalyDetectorStatus::Failed
      when "DELETED"      then ACWL::AnomalyDetectorStatus::Deleted
      when "PAUSED"       then ACWL::AnomalyDetectorStatus::Paused
      else
        raise Exception.new("unknown enum value for 'AnomalyDetectorStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACWL::AnomalyDetectorStatus::Initializing then "INITIALIZING"
      when ACWL::AnomalyDetectorStatus::Training     then "TRAINING"
      when ACWL::AnomalyDetectorStatus::Analyzing    then "ANALYZING"
      when ACWL::AnomalyDetectorStatus::Failed       then "FAILED"
      when ACWL::AnomalyDetectorStatus::Deleted      then "DELETED"
      when ACWL::AnomalyDetectorStatus::Paused       then "PAUSED"
      else
        raise Exception.new("unknown enum value for 'AnomalyDetectorStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACWL::AnomalyDetectorStatus?
      case key
      when "INITIALIZING" then ACWL::AnomalyDetectorStatus::Initializing
      when "TRAINING"     then ACWL::AnomalyDetectorStatus::Training
      when "ANALYZING"    then ACWL::AnomalyDetectorStatus::Analyzing
      when "FAILED"       then ACWL::AnomalyDetectorStatus::Failed
      when "DELETED"      then ACWL::AnomalyDetectorStatus::Deleted
      when "PAUSED"       then ACWL::AnomalyDetectorStatus::Paused
      else
        nil
      end
    end
  end
end
