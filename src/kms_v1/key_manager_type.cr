private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  enum KeyManagerType
    Aws
    Customer

    def self.to_json(e : KeyManagerType, json : JSON::Builder) : Nil
      value = case e
              when AK::KeyManagerType::Aws      then "AWS"
              when AK::KeyManagerType::Customer then "CUSTOMER"
              else
                raise Exception.new("unknown enum value for 'KeyManagerType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::KeyManagerType
      value = pull.read_string
      case value
      when "AWS"      then AK::KeyManagerType::Aws
      when "CUSTOMER" then AK::KeyManagerType::Customer
      else
        raise Exception.new("unknown enum value for 'KeyManagerType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::KeyManagerType::Aws      then "AWS"
      when AK::KeyManagerType::Customer then "CUSTOMER"
      else
        raise Exception.new("unknown enum value for 'KeyManagerType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::KeyManagerType?
      case key
      when "AWS"      then AK::KeyManagerType::Aws
      when "CUSTOMER" then AK::KeyManagerType::Customer
      else
        nil
      end
    end
  end
end
