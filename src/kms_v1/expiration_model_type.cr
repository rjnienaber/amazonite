private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  enum ExpirationModelType
    KeyMaterialExpires
    KeyMaterialDoesNotExpire

    def self.to_json(e : ExpirationModelType, json : JSON::Builder) : Nil
      value = case e
              when AK::ExpirationModelType::KeyMaterialExpires       then "KEY_MATERIAL_EXPIRES"
              when AK::ExpirationModelType::KeyMaterialDoesNotExpire then "KEY_MATERIAL_DOES_NOT_EXPIRE"
              else
                raise Exception.new("unknown enum value for 'ExpirationModelType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::ExpirationModelType
      value = pull.read_string
      case value
      when "KEY_MATERIAL_EXPIRES"         then AK::ExpirationModelType::KeyMaterialExpires
      when "KEY_MATERIAL_DOES_NOT_EXPIRE" then AK::ExpirationModelType::KeyMaterialDoesNotExpire
      else
        raise Exception.new("unknown enum value for 'ExpirationModelType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::ExpirationModelType::KeyMaterialExpires       then "KEY_MATERIAL_EXPIRES"
      when AK::ExpirationModelType::KeyMaterialDoesNotExpire then "KEY_MATERIAL_DOES_NOT_EXPIRE"
      else
        raise Exception.new("unknown enum value for 'ExpirationModelType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::ExpirationModelType?
      case key
      when "KEY_MATERIAL_EXPIRES"         then AK::ExpirationModelType::KeyMaterialExpires
      when "KEY_MATERIAL_DOES_NOT_EXPIRE" then AK::ExpirationModelType::KeyMaterialDoesNotExpire
      else
        nil
      end
    end
  end
end
