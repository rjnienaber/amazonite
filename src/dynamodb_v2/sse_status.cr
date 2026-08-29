private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  enum SSEStatus
    Enabling
    Enabled
    Disabling
    Disabled
    Updating

    def self.to_json(e : SSEStatus, json : JSON::Builder) : Nil
      value = case e
              when ADDB::SSEStatus::Enabling  then "ENABLING"
              when ADDB::SSEStatus::Enabled   then "ENABLED"
              when ADDB::SSEStatus::Disabling then "DISABLING"
              when ADDB::SSEStatus::Disabled  then "DISABLED"
              when ADDB::SSEStatus::Updating  then "UPDATING"
              else
                raise Exception.new("unknown enum value for 'SSEStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::SSEStatus
      value = pull.read_string
      case value
      when "ENABLING"  then ADDB::SSEStatus::Enabling
      when "ENABLED"   then ADDB::SSEStatus::Enabled
      when "DISABLING" then ADDB::SSEStatus::Disabling
      when "DISABLED"  then ADDB::SSEStatus::Disabled
      when "UPDATING"  then ADDB::SSEStatus::Updating
      else
        raise Exception.new("unknown enum value for 'SSEStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ADDB::SSEStatus::Enabling  then "ENABLING"
      when ADDB::SSEStatus::Enabled   then "ENABLED"
      when ADDB::SSEStatus::Disabling then "DISABLING"
      when ADDB::SSEStatus::Disabled  then "DISABLED"
      when ADDB::SSEStatus::Updating  then "UPDATING"
      else
        raise Exception.new("unknown enum value for 'SSEStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ADDB::SSEStatus?
      case key
      when "ENABLING"  then ADDB::SSEStatus::Enabling
      when "ENABLED"   then ADDB::SSEStatus::Enabled
      when "DISABLING" then ADDB::SSEStatus::Disabling
      when "DISABLED"  then ADDB::SSEStatus::Disabled
      when "UPDATING"  then ADDB::SSEStatus::Updating
      else
        nil
      end
    end
  end
end
