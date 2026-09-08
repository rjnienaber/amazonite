private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum IngestionStatus
    InitialIngestionInProgress
    IngestionComplete
    IngestionFailed

    def self.to_json(e : IngestionStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::IngestionStatus::InitialIngestionInProgress then "initial-ingestion-in-progress"
              when AEC::IngestionStatus::IngestionComplete          then "ingestion-complete"
              when AEC::IngestionStatus::IngestionFailed            then "ingestion-failed"
              else
                raise Exception.new("unknown enum value for 'IngestionStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::IngestionStatus
      value = pull.read_string
      case value
      when "initial-ingestion-in-progress" then AEC::IngestionStatus::InitialIngestionInProgress
      when "ingestion-complete"            then AEC::IngestionStatus::IngestionComplete
      when "ingestion-failed"              then AEC::IngestionStatus::IngestionFailed
      else
        raise Exception.new("unknown enum value for 'IngestionStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::IngestionStatus::InitialIngestionInProgress then "initial-ingestion-in-progress"
      when AEC::IngestionStatus::IngestionComplete          then "ingestion-complete"
      when AEC::IngestionStatus::IngestionFailed            then "ingestion-failed"
      else
        raise Exception.new("unknown enum value for 'IngestionStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::IngestionStatus?
      case key
      when "initial-ingestion-in-progress" then AEC::IngestionStatus::InitialIngestionInProgress
      when "ingestion-complete"            then AEC::IngestionStatus::IngestionComplete
      when "ingestion-failed"              then AEC::IngestionStatus::IngestionFailed
      else
        nil
      end
    end
  end
end
