private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum AutoAcceptSharedAttachmentsValue
    Enable
    Disable

    def self.to_json(e : AutoAcceptSharedAttachmentsValue, json : JSON::Builder) : Nil
      value = case e
              when AEC::AutoAcceptSharedAttachmentsValue::Enable  then "enable"
              when AEC::AutoAcceptSharedAttachmentsValue::Disable then "disable"
              else
                raise Exception.new("unknown enum value for 'AutoAcceptSharedAttachmentsValue' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::AutoAcceptSharedAttachmentsValue
      value = pull.read_string
      case value
      when "enable"  then AEC::AutoAcceptSharedAttachmentsValue::Enable
      when "disable" then AEC::AutoAcceptSharedAttachmentsValue::Disable
      else
        raise Exception.new("unknown enum value for 'AutoAcceptSharedAttachmentsValue' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::AutoAcceptSharedAttachmentsValue::Enable  then "enable"
      when AEC::AutoAcceptSharedAttachmentsValue::Disable then "disable"
      else
        raise Exception.new("unknown enum value for 'AutoAcceptSharedAttachmentsValue' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::AutoAcceptSharedAttachmentsValue?
      case key
      when "enable"  then AEC::AutoAcceptSharedAttachmentsValue::Enable
      when "disable" then AEC::AutoAcceptSharedAttachmentsValue::Disable
      else
        nil
      end
    end
  end
end
