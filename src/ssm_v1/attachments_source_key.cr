private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum AttachmentsSourceKey
    SourceUrl
    S3FileUrl
    AttachmentReference

    def self.to_json(e : AttachmentsSourceKey, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::AttachmentsSourceKey
      value = pull.read_string
      case value
      when "SourceUrl"           then AS::AttachmentsSourceKey::SourceUrl
      when "S3FileUrl"           then AS::AttachmentsSourceKey::S3FileUrl
      when "AttachmentReference" then AS::AttachmentsSourceKey::AttachmentReference
      else
        raise Exception.new("unknown enum value for 'AttachmentsSourceKey' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::AttachmentsSourceKey?
      case key
      when "SourceUrl"           then AS::AttachmentsSourceKey::SourceUrl
      when "S3FileUrl"           then AS::AttachmentsSourceKey::S3FileUrl
      when "AttachmentReference" then AS::AttachmentsSourceKey::AttachmentReference
      else
        nil
      end
    end
  end
end
