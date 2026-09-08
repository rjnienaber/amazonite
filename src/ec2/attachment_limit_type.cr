private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum AttachmentLimitType
    Shared
    Dedicated

    def self.to_json(e : AttachmentLimitType, json : JSON::Builder) : Nil
      value = case e
              when AEC::AttachmentLimitType::Shared    then "shared"
              when AEC::AttachmentLimitType::Dedicated then "dedicated"
              else
                raise Exception.new("unknown enum value for 'AttachmentLimitType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::AttachmentLimitType
      value = pull.read_string
      case value
      when "shared"    then AEC::AttachmentLimitType::Shared
      when "dedicated" then AEC::AttachmentLimitType::Dedicated
      else
        raise Exception.new("unknown enum value for 'AttachmentLimitType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::AttachmentLimitType::Shared    then "shared"
      when AEC::AttachmentLimitType::Dedicated then "dedicated"
      else
        raise Exception.new("unknown enum value for 'AttachmentLimitType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::AttachmentLimitType?
      case key
      when "shared"    then AEC::AttachmentLimitType::Shared
      when "dedicated" then AEC::AttachmentLimitType::Dedicated
      else
        nil
      end
    end
  end
end
