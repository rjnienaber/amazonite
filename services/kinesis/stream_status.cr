private alias AK = Amazonite::Kinesis

module Amazonite::Kinesis
  enum StreamStatus
    Creating
    Deleting
    Active
    Updating

    def self.to_json(e : StreamStatus, json : JSON::Builder) : Nil
      value = case e
              when AK::StreamStatus::Creating then "CREATING"
              when AK::StreamStatus::Deleting then "DELETING"
              when AK::StreamStatus::Active   then "ACTIVE"
              when AK::StreamStatus::Updating then "UPDATING"
              else
                raise Exception.new("unknown enum value for 'StreamStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::StreamStatus
      value = pull.read_string
      case value
      when "CREATING" then AK::StreamStatus::Creating
      when "DELETING" then AK::StreamStatus::Deleting
      when "ACTIVE"   then AK::StreamStatus::Active
      when "UPDATING" then AK::StreamStatus::Updating
      else
        raise Exception.new("unknown enum value for 'StreamStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::StreamStatus::Creating then "CREATING"
      when AK::StreamStatus::Deleting then "DELETING"
      when AK::StreamStatus::Active   then "ACTIVE"
      when AK::StreamStatus::Updating then "UPDATING"
      else
        raise Exception.new("unknown enum value for 'StreamStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::StreamStatus?
      case key
      when "CREATING" then AK::StreamStatus::Creating
      when "DELETING" then AK::StreamStatus::Deleting
      when "ACTIVE"   then AK::StreamStatus::Active
      when "UPDATING" then AK::StreamStatus::Updating
      else
        nil
      end
    end
  end
end
