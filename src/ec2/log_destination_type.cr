private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum LogDestinationType
    CloudWatchLogs
    S3
    KinesisDataFirehose

    def self.to_json(e : LogDestinationType, json : JSON::Builder) : Nil
      value = case e
              when AEC::LogDestinationType::CloudWatchLogs      then "cloud-watch-logs"
              when AEC::LogDestinationType::S3                  then "s3"
              when AEC::LogDestinationType::KinesisDataFirehose then "kinesis-data-firehose"
              else
                raise Exception.new("unknown enum value for 'LogDestinationType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::LogDestinationType
      value = pull.read_string
      case value
      when "cloud-watch-logs"      then AEC::LogDestinationType::CloudWatchLogs
      when "s3"                    then AEC::LogDestinationType::S3
      when "kinesis-data-firehose" then AEC::LogDestinationType::KinesisDataFirehose
      else
        raise Exception.new("unknown enum value for 'LogDestinationType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::LogDestinationType::CloudWatchLogs      then "cloud-watch-logs"
      when AEC::LogDestinationType::S3                  then "s3"
      when AEC::LogDestinationType::KinesisDataFirehose then "kinesis-data-firehose"
      else
        raise Exception.new("unknown enum value for 'LogDestinationType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::LogDestinationType?
      case key
      when "cloud-watch-logs"      then AEC::LogDestinationType::CloudWatchLogs
      when "s3"                    then AEC::LogDestinationType::S3
      when "kinesis-data-firehose" then AEC::LogDestinationType::KinesisDataFirehose
      else
        nil
      end
    end
  end
end
