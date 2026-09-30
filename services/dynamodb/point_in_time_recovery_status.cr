private alias ADDB = Amazonite::DynamoDB

module Amazonite::DynamoDB
  enum PointInTimeRecoveryStatus
    Enabled
    Disabled

    def self.to_json(e : PointInTimeRecoveryStatus, json : JSON::Builder) : Nil
      value = case e
              when ADDB::PointInTimeRecoveryStatus::Enabled  then "ENABLED"
              when ADDB::PointInTimeRecoveryStatus::Disabled then "DISABLED"
              else
                raise Exception.new("unknown enum value for 'PointInTimeRecoveryStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::PointInTimeRecoveryStatus
      value = pull.read_string
      case value
      when "ENABLED"  then ADDB::PointInTimeRecoveryStatus::Enabled
      when "DISABLED" then ADDB::PointInTimeRecoveryStatus::Disabled
      else
        raise Exception.new("unknown enum value for 'PointInTimeRecoveryStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ADDB::PointInTimeRecoveryStatus::Enabled  then "ENABLED"
      when ADDB::PointInTimeRecoveryStatus::Disabled then "DISABLED"
      else
        raise Exception.new("unknown enum value for 'PointInTimeRecoveryStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ADDB::PointInTimeRecoveryStatus?
      case key
      when "ENABLED"  then ADDB::PointInTimeRecoveryStatus::Enabled
      when "DISABLED" then ADDB::PointInTimeRecoveryStatus::Disabled
      else
        nil
      end
    end
  end
end
