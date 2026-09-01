private alias AK = Amazonite::Kms

module Amazonite::Kms
  enum KeyMaterialState
    NonCurrent
    Current
    PendingRotation
    PendingMultiRegionImportAndRotation

    def self.to_json(e : KeyMaterialState, json : JSON::Builder) : Nil
      value = case e
              when AK::KeyMaterialState::NonCurrent                          then "NON_CURRENT"
              when AK::KeyMaterialState::Current                             then "CURRENT"
              when AK::KeyMaterialState::PendingRotation                     then "PENDING_ROTATION"
              when AK::KeyMaterialState::PendingMultiRegionImportAndRotation then "PENDING_MULTI_REGION_IMPORT_AND_ROTATION"
              else
                raise Exception.new("unknown enum value for 'KeyMaterialState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::KeyMaterialState
      value = pull.read_string
      case value
      when "NON_CURRENT"                              then AK::KeyMaterialState::NonCurrent
      when "CURRENT"                                  then AK::KeyMaterialState::Current
      when "PENDING_ROTATION"                         then AK::KeyMaterialState::PendingRotation
      when "PENDING_MULTI_REGION_IMPORT_AND_ROTATION" then AK::KeyMaterialState::PendingMultiRegionImportAndRotation
      else
        raise Exception.new("unknown enum value for 'KeyMaterialState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::KeyMaterialState::NonCurrent                          then "NON_CURRENT"
      when AK::KeyMaterialState::Current                             then "CURRENT"
      when AK::KeyMaterialState::PendingRotation                     then "PENDING_ROTATION"
      when AK::KeyMaterialState::PendingMultiRegionImportAndRotation then "PENDING_MULTI_REGION_IMPORT_AND_ROTATION"
      else
        raise Exception.new("unknown enum value for 'KeyMaterialState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::KeyMaterialState?
      case key
      when "NON_CURRENT"                              then AK::KeyMaterialState::NonCurrent
      when "CURRENT"                                  then AK::KeyMaterialState::Current
      when "PENDING_ROTATION"                         then AK::KeyMaterialState::PendingRotation
      when "PENDING_MULTI_REGION_IMPORT_AND_ROTATION" then AK::KeyMaterialState::PendingMultiRegionImportAndRotation
      else
        nil
      end
    end
  end
end
