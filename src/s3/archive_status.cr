private alias AS = Amazonite::S3

module Amazonite::S3
  enum ArchiveStatus
    ArchiveAccess
    DeepArchiveAccess

    def self.to_json(e : ArchiveStatus, json : JSON::Builder) : Nil
      value = case e
              when AS::ArchiveStatus::ArchiveAccess     then "ARCHIVE_ACCESS"
              when AS::ArchiveStatus::DeepArchiveAccess then "DEEP_ARCHIVE_ACCESS"
              else
                raise Exception.new("unknown enum value for 'ArchiveStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ArchiveStatus
      value = pull.read_string
      case value
      when "ARCHIVE_ACCESS"      then AS::ArchiveStatus::ArchiveAccess
      when "DEEP_ARCHIVE_ACCESS" then AS::ArchiveStatus::DeepArchiveAccess
      else
        raise Exception.new("unknown enum value for 'ArchiveStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::ArchiveStatus::ArchiveAccess     then "ARCHIVE_ACCESS"
      when AS::ArchiveStatus::DeepArchiveAccess then "DEEP_ARCHIVE_ACCESS"
      else
        raise Exception.new("unknown enum value for 'ArchiveStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::ArchiveStatus?
      case key
      when "ARCHIVE_ACCESS"      then AS::ArchiveStatus::ArchiveAccess
      when "DEEP_ARCHIVE_ACCESS" then AS::ArchiveStatus::DeepArchiveAccess
      else
        nil
      end
    end
  end
end
