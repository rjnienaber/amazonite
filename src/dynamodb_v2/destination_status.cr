private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  enum DestinationStatus
    Enabling
    Active
    Disabling
    Disabled
    EnableFailed

    def self.to_json(e : DestinationStatus, json : JSON::Builder) : Nil
      value = case e
              when ADDB::DestinationStatus::Enabling     then "ENABLING"
              when ADDB::DestinationStatus::Active       then "ACTIVE"
              when ADDB::DestinationStatus::Disabling    then "DISABLING"
              when ADDB::DestinationStatus::Disabled     then "DISABLED"
              when ADDB::DestinationStatus::EnableFailed then "ENABLE_FAILED"
              else
                raise Exception.new("unknown enum value for 'DestinationStatus' when serializing to json: '#{e.to_s}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::DestinationStatus
      value = pull.read_string
      case value
      when "ENABLING"      then ADDB::DestinationStatus::Enabling
      when "ACTIVE"        then ADDB::DestinationStatus::Active
      when "DISABLING"     then ADDB::DestinationStatus::Disabling
      when "DISABLED"      then ADDB::DestinationStatus::Disabled
      when "ENABLE_FAILED" then ADDB::DestinationStatus::EnableFailed
      else
        raise Exception.new("unknown enum value for 'DestinationStatus' when deserializing from json: '#{value}'")
      end
    end
  end
end
