private alias AS = Amazonite::S3

module Amazonite::S3
  enum TransitionStorageClass
    Glacier
    StandardIa
    OnezoneIa
    IntelligentTiering
    DeepArchive
    GlacierIr

    def self.to_json(e : TransitionStorageClass, json : JSON::Builder) : Nil
      value = case e
              when AS::TransitionStorageClass::Glacier            then "GLACIER"
              when AS::TransitionStorageClass::StandardIa         then "STANDARD_IA"
              when AS::TransitionStorageClass::OnezoneIa          then "ONEZONE_IA"
              when AS::TransitionStorageClass::IntelligentTiering then "INTELLIGENT_TIERING"
              when AS::TransitionStorageClass::DeepArchive        then "DEEP_ARCHIVE"
              when AS::TransitionStorageClass::GlacierIr          then "GLACIER_IR"
              else
                raise Exception.new("unknown enum value for 'TransitionStorageClass' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::TransitionStorageClass
      value = pull.read_string
      case value
      when "GLACIER"             then AS::TransitionStorageClass::Glacier
      when "STANDARD_IA"         then AS::TransitionStorageClass::StandardIa
      when "ONEZONE_IA"          then AS::TransitionStorageClass::OnezoneIa
      when "INTELLIGENT_TIERING" then AS::TransitionStorageClass::IntelligentTiering
      when "DEEP_ARCHIVE"        then AS::TransitionStorageClass::DeepArchive
      when "GLACIER_IR"          then AS::TransitionStorageClass::GlacierIr
      else
        raise Exception.new("unknown enum value for 'TransitionStorageClass' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::TransitionStorageClass::Glacier            then "GLACIER"
      when AS::TransitionStorageClass::StandardIa         then "STANDARD_IA"
      when AS::TransitionStorageClass::OnezoneIa          then "ONEZONE_IA"
      when AS::TransitionStorageClass::IntelligentTiering then "INTELLIGENT_TIERING"
      when AS::TransitionStorageClass::DeepArchive        then "DEEP_ARCHIVE"
      when AS::TransitionStorageClass::GlacierIr          then "GLACIER_IR"
      else
        raise Exception.new("unknown enum value for 'TransitionStorageClass' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::TransitionStorageClass?
      case key
      when "GLACIER"             then AS::TransitionStorageClass::Glacier
      when "STANDARD_IA"         then AS::TransitionStorageClass::StandardIa
      when "ONEZONE_IA"          then AS::TransitionStorageClass::OnezoneIa
      when "INTELLIGENT_TIERING" then AS::TransitionStorageClass::IntelligentTiering
      when "DEEP_ARCHIVE"        then AS::TransitionStorageClass::DeepArchive
      when "GLACIER_IR"          then AS::TransitionStorageClass::GlacierIr
      else
        nil
      end
    end
  end
end
