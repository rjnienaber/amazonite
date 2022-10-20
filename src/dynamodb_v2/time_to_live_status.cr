private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  enum TimeToLiveStatus
    Enabling
    Disabling
    Enabled
    Disabled

    def self.to_json(e : TimeToLiveStatus, json : JSON::Builder) : Nil
      value = case e
              when ADDB::TimeToLiveStatus::Enabling  then "ENABLING"
              when ADDB::TimeToLiveStatus::Disabling then "DISABLING"
              when ADDB::TimeToLiveStatus::Enabled   then "ENABLED"
              when ADDB::TimeToLiveStatus::Disabled  then "DISABLED"
              else
                raise Exception.new("unknown enum value for 'TimeToLiveStatus' when serializing to json: '#{e.to_s}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::TimeToLiveStatus
      value = pull.read_string
      case value
      when "ENABLING"  then ADDB::TimeToLiveStatus::Enabling
      when "DISABLING" then ADDB::TimeToLiveStatus::Disabling
      when "ENABLED"   then ADDB::TimeToLiveStatus::Enabled
      when "DISABLED"  then ADDB::TimeToLiveStatus::Disabled
      else
        raise Exception.new("unknown enum value for 'TimeToLiveStatus' when deserializing from json: '#{value}'")
      end
    end
  end
end
