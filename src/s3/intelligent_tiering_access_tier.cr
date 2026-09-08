private alias AS = Amazonite::S3

module Amazonite::S3
  enum IntelligentTieringAccessTier
    ArchiveAccess
    DeepArchiveAccess

    def self.to_json(e : IntelligentTieringAccessTier, json : JSON::Builder) : Nil
      value = case e
              when AS::IntelligentTieringAccessTier::ArchiveAccess     then "ARCHIVE_ACCESS"
              when AS::IntelligentTieringAccessTier::DeepArchiveAccess then "DEEP_ARCHIVE_ACCESS"
              else
                raise Exception.new("unknown enum value for 'IntelligentTieringAccessTier' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::IntelligentTieringAccessTier
      value = pull.read_string
      case value
      when "ARCHIVE_ACCESS"      then AS::IntelligentTieringAccessTier::ArchiveAccess
      when "DEEP_ARCHIVE_ACCESS" then AS::IntelligentTieringAccessTier::DeepArchiveAccess
      else
        raise Exception.new("unknown enum value for 'IntelligentTieringAccessTier' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::IntelligentTieringAccessTier::ArchiveAccess     then "ARCHIVE_ACCESS"
      when AS::IntelligentTieringAccessTier::DeepArchiveAccess then "DEEP_ARCHIVE_ACCESS"
      else
        raise Exception.new("unknown enum value for 'IntelligentTieringAccessTier' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::IntelligentTieringAccessTier?
      case key
      when "ARCHIVE_ACCESS"      then AS::IntelligentTieringAccessTier::ArchiveAccess
      when "DEEP_ARCHIVE_ACCESS" then AS::IntelligentTieringAccessTier::DeepArchiveAccess
      else
        nil
      end
    end
  end
end
