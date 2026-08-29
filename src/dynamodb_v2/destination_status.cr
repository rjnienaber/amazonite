private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  enum DestinationStatus
    Enabling
    Active
    Disabling
    Disabled
    EnableFailed
    Updating

    def self.to_json(e : DestinationStatus, json : JSON::Builder) : Nil
      value = case e
              when ADDB::DestinationStatus::Enabling     then "ENABLING"
              when ADDB::DestinationStatus::Active       then "ACTIVE"
              when ADDB::DestinationStatus::Disabling    then "DISABLING"
              when ADDB::DestinationStatus::Disabled     then "DISABLED"
              when ADDB::DestinationStatus::EnableFailed then "ENABLE_FAILED"
              when ADDB::DestinationStatus::Updating     then "UPDATING"
              else
                raise Exception.new("unknown enum value for 'DestinationStatus' when serializing to json: '#{e}'")
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
      when "UPDATING"      then ADDB::DestinationStatus::Updating
      else
        raise Exception.new("unknown enum value for 'DestinationStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ADDB::DestinationStatus::Enabling     then "ENABLING"
      when ADDB::DestinationStatus::Active       then "ACTIVE"
      when ADDB::DestinationStatus::Disabling    then "DISABLING"
      when ADDB::DestinationStatus::Disabled     then "DISABLED"
      when ADDB::DestinationStatus::EnableFailed then "ENABLE_FAILED"
      when ADDB::DestinationStatus::Updating     then "UPDATING"
      else
        raise Exception.new("unknown enum value for 'DestinationStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ADDB::DestinationStatus?
      case key
      when "ENABLING"      then ADDB::DestinationStatus::Enabling
      when "ACTIVE"        then ADDB::DestinationStatus::Active
      when "DISABLING"     then ADDB::DestinationStatus::Disabling
      when "DISABLED"      then ADDB::DestinationStatus::Disabled
      when "ENABLE_FAILED" then ADDB::DestinationStatus::EnableFailed
      when "UPDATING"      then ADDB::DestinationStatus::Updating
      else
        nil
      end
    end
  end
end
