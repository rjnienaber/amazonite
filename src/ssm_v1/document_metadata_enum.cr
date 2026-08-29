private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum DocumentMetadataEnum
    DocumentReviews

    def self.to_json(e : DocumentMetadataEnum, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::DocumentMetadataEnum
      value = pull.read_string
      case value
      when "DocumentReviews" then AS::DocumentMetadataEnum::DocumentReviews
      else
        raise Exception.new("unknown enum value for 'DocumentMetadataEnum' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::DocumentMetadataEnum?
      case key
      when "DocumentReviews" then AS::DocumentMetadataEnum::DocumentReviews
      else
        nil
      end
    end
  end
end
