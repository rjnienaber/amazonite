private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum AutoAcceptSharedAssociationsValue
    Enable
    Disable

    def self.to_json(e : AutoAcceptSharedAssociationsValue, json : JSON::Builder) : Nil
      value = case e
              when AEC::AutoAcceptSharedAssociationsValue::Enable  then "enable"
              when AEC::AutoAcceptSharedAssociationsValue::Disable then "disable"
              else
                raise Exception.new("unknown enum value for 'AutoAcceptSharedAssociationsValue' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::AutoAcceptSharedAssociationsValue
      value = pull.read_string
      case value
      when "enable"  then AEC::AutoAcceptSharedAssociationsValue::Enable
      when "disable" then AEC::AutoAcceptSharedAssociationsValue::Disable
      else
        raise Exception.new("unknown enum value for 'AutoAcceptSharedAssociationsValue' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::AutoAcceptSharedAssociationsValue::Enable  then "enable"
      when AEC::AutoAcceptSharedAssociationsValue::Disable then "disable"
      else
        raise Exception.new("unknown enum value for 'AutoAcceptSharedAssociationsValue' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::AutoAcceptSharedAssociationsValue?
      case key
      when "enable"  then AEC::AutoAcceptSharedAssociationsValue::Enable
      when "disable" then AEC::AutoAcceptSharedAssociationsValue::Disable
      else
        nil
      end
    end
  end
end
