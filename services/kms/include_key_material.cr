private alias AK = Amazonite::Kms

module Amazonite::Kms
  enum IncludeKeyMaterial
    AllKeyMaterial
    RotationsOnly

    def self.to_json(e : IncludeKeyMaterial, json : JSON::Builder) : Nil
      value = case e
              when AK::IncludeKeyMaterial::AllKeyMaterial then "ALL_KEY_MATERIAL"
              when AK::IncludeKeyMaterial::RotationsOnly  then "ROTATIONS_ONLY"
              else
                raise Exception.new("unknown enum value for 'IncludeKeyMaterial' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::IncludeKeyMaterial
      value = pull.read_string
      case value
      when "ALL_KEY_MATERIAL" then AK::IncludeKeyMaterial::AllKeyMaterial
      when "ROTATIONS_ONLY"   then AK::IncludeKeyMaterial::RotationsOnly
      else
        raise Exception.new("unknown enum value for 'IncludeKeyMaterial' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::IncludeKeyMaterial::AllKeyMaterial then "ALL_KEY_MATERIAL"
      when AK::IncludeKeyMaterial::RotationsOnly  then "ROTATIONS_ONLY"
      else
        raise Exception.new("unknown enum value for 'IncludeKeyMaterial' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::IncludeKeyMaterial?
      case key
      when "ALL_KEY_MATERIAL" then AK::IncludeKeyMaterial::AllKeyMaterial
      when "ROTATIONS_ONLY"   then AK::IncludeKeyMaterial::RotationsOnly
      else
        nil
      end
    end
  end
end
