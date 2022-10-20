private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  enum PointInTimeRecoveryStatus
    Enabled
    Disabled

    def self.to_json(e : PointInTimeRecoveryStatus, json : JSON::Builder) : Nil
      value = case e
              when ADDB::PointInTimeRecoveryStatus::Enabled  then "ENABLED"
              when ADDB::PointInTimeRecoveryStatus::Disabled then "DISABLED"
              else
                raise Exception.new("unknown enum value for 'PointInTimeRecoveryStatus' when serializing to json: '#{e.to_s}'")
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
  end
end
