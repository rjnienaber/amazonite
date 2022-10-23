private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  enum ContinuousBackupsStatus
    Enabled
    Disabled

    def self.to_json(e : ContinuousBackupsStatus, json : JSON::Builder) : Nil
      value = case e
              when ADDB::ContinuousBackupsStatus::Enabled  then "ENABLED"
              when ADDB::ContinuousBackupsStatus::Disabled then "DISABLED"
              else
                raise Exception.new("unknown enum value for 'ContinuousBackupsStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::ContinuousBackupsStatus
      value = pull.read_string
      case value
      when "ENABLED"  then ADDB::ContinuousBackupsStatus::Enabled
      when "DISABLED" then ADDB::ContinuousBackupsStatus::Disabled
      else
        raise Exception.new("unknown enum value for 'ContinuousBackupsStatus' when deserializing from json: '#{value}'")
      end
    end
  end
end
