private alias AK = Amazonite::Kms

module Amazonite::Kms
  enum ImportType
    NewKeyMaterial
    ExistingKeyMaterial

    def self.to_json(e : ImportType, json : JSON::Builder) : Nil
      value = case e
              when AK::ImportType::NewKeyMaterial      then "NEW_KEY_MATERIAL"
              when AK::ImportType::ExistingKeyMaterial then "EXISTING_KEY_MATERIAL"
              else
                raise Exception.new("unknown enum value for 'ImportType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::ImportType
      value = pull.read_string
      case value
      when "NEW_KEY_MATERIAL"      then AK::ImportType::NewKeyMaterial
      when "EXISTING_KEY_MATERIAL" then AK::ImportType::ExistingKeyMaterial
      else
        raise Exception.new("unknown enum value for 'ImportType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::ImportType::NewKeyMaterial      then "NEW_KEY_MATERIAL"
      when AK::ImportType::ExistingKeyMaterial then "EXISTING_KEY_MATERIAL"
      else
        raise Exception.new("unknown enum value for 'ImportType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::ImportType?
      case key
      when "NEW_KEY_MATERIAL"      then AK::ImportType::NewKeyMaterial
      when "EXISTING_KEY_MATERIAL" then AK::ImportType::ExistingKeyMaterial
      else
        nil
      end
    end
  end
end
