private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum AdditionalKeyExchangeRequirement
    Required
    Optional

    def self.to_json(e : AdditionalKeyExchangeRequirement, json : JSON::Builder) : Nil
      value = case e
              when AEC::AdditionalKeyExchangeRequirement::Required then "required"
              when AEC::AdditionalKeyExchangeRequirement::Optional then "optional"
              else
                raise Exception.new("unknown enum value for 'AdditionalKeyExchangeRequirement' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::AdditionalKeyExchangeRequirement
      value = pull.read_string
      case value
      when "required" then AEC::AdditionalKeyExchangeRequirement::Required
      when "optional" then AEC::AdditionalKeyExchangeRequirement::Optional
      else
        raise Exception.new("unknown enum value for 'AdditionalKeyExchangeRequirement' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::AdditionalKeyExchangeRequirement::Required then "required"
      when AEC::AdditionalKeyExchangeRequirement::Optional then "optional"
      else
        raise Exception.new("unknown enum value for 'AdditionalKeyExchangeRequirement' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::AdditionalKeyExchangeRequirement?
      case key
      when "required" then AEC::AdditionalKeyExchangeRequirement::Required
      when "optional" then AEC::AdditionalKeyExchangeRequirement::Optional
      else
        nil
      end
    end
  end
end
