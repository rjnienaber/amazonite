private alias ADDB = Amazonite::DynamoDB

module Amazonite::DynamoDB
  enum ExportViewType
    NewImage
    NewAndOldImages

    def self.to_json(e : ExportViewType, json : JSON::Builder) : Nil
      value = case e
              when ADDB::ExportViewType::NewImage        then "NEW_IMAGE"
              when ADDB::ExportViewType::NewAndOldImages then "NEW_AND_OLD_IMAGES"
              else
                raise Exception.new("unknown enum value for 'ExportViewType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::ExportViewType
      value = pull.read_string
      case value
      when "NEW_IMAGE"          then ADDB::ExportViewType::NewImage
      when "NEW_AND_OLD_IMAGES" then ADDB::ExportViewType::NewAndOldImages
      else
        raise Exception.new("unknown enum value for 'ExportViewType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ADDB::ExportViewType::NewImage        then "NEW_IMAGE"
      when ADDB::ExportViewType::NewAndOldImages then "NEW_AND_OLD_IMAGES"
      else
        raise Exception.new("unknown enum value for 'ExportViewType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ADDB::ExportViewType?
      case key
      when "NEW_IMAGE"          then ADDB::ExportViewType::NewImage
      when "NEW_AND_OLD_IMAGES" then ADDB::ExportViewType::NewAndOldImages
      else
        nil
      end
    end
  end
end
