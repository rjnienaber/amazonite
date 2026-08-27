private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
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
  end
end
