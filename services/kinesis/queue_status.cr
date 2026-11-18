private alias AK = Amazonite::Kinesis

module Amazonite::Kinesis
  enum QueueStatus
    Creating
    Active
    Updating
    Deleting

    def self.to_json(e : QueueStatus, json : JSON::Builder) : Nil
      value = case e
              when AK::QueueStatus::Creating then "CREATING"
              when AK::QueueStatus::Active   then "ACTIVE"
              when AK::QueueStatus::Updating then "UPDATING"
              when AK::QueueStatus::Deleting then "DELETING"
              else
                raise Exception.new("unknown enum value for 'QueueStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::QueueStatus
      value = pull.read_string
      case value
      when "CREATING" then AK::QueueStatus::Creating
      when "ACTIVE"   then AK::QueueStatus::Active
      when "UPDATING" then AK::QueueStatus::Updating
      when "DELETING" then AK::QueueStatus::Deleting
      else
        raise Exception.new("unknown enum value for 'QueueStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::QueueStatus::Creating then "CREATING"
      when AK::QueueStatus::Active   then "ACTIVE"
      when AK::QueueStatus::Updating then "UPDATING"
      when AK::QueueStatus::Deleting then "DELETING"
      else
        raise Exception.new("unknown enum value for 'QueueStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::QueueStatus?
      case key
      when "CREATING" then AK::QueueStatus::Creating
      when "ACTIVE"   then AK::QueueStatus::Active
      when "UPDATING" then AK::QueueStatus::Updating
      when "DELETING" then AK::QueueStatus::Deleting
      else
        nil
      end
    end
  end
end
