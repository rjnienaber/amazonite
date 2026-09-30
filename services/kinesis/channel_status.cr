private alias AK = Amazonite::Kinesis

module Amazonite::Kinesis
  enum ChannelStatus
    Creating
    Active
    Updating
    Deleting
    Failed

    def self.to_json(e : ChannelStatus, json : JSON::Builder) : Nil
      value = case e
              when AK::ChannelStatus::Creating then "CREATING"
              when AK::ChannelStatus::Active   then "ACTIVE"
              when AK::ChannelStatus::Updating then "UPDATING"
              when AK::ChannelStatus::Deleting then "DELETING"
              when AK::ChannelStatus::Failed   then "FAILED"
              else
                raise Exception.new("unknown enum value for 'ChannelStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::ChannelStatus
      value = pull.read_string
      case value
      when "CREATING" then AK::ChannelStatus::Creating
      when "ACTIVE"   then AK::ChannelStatus::Active
      when "UPDATING" then AK::ChannelStatus::Updating
      when "DELETING" then AK::ChannelStatus::Deleting
      when "FAILED"   then AK::ChannelStatus::Failed
      else
        raise Exception.new("unknown enum value for 'ChannelStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::ChannelStatus::Creating then "CREATING"
      when AK::ChannelStatus::Active   then "ACTIVE"
      when AK::ChannelStatus::Updating then "UPDATING"
      when AK::ChannelStatus::Deleting then "DELETING"
      when AK::ChannelStatus::Failed   then "FAILED"
      else
        raise Exception.new("unknown enum value for 'ChannelStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::ChannelStatus?
      case key
      when "CREATING" then AK::ChannelStatus::Creating
      when "ACTIVE"   then AK::ChannelStatus::Active
      when "UPDATING" then AK::ChannelStatus::Updating
      when "DELETING" then AK::ChannelStatus::Deleting
      when "FAILED"   then AK::ChannelStatus::Failed
      else
        nil
      end
    end
  end
end
