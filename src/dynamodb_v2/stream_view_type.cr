private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  enum StreamViewType
    NewImage
    OldImage
    NewAndOldImages
    KeysOnly

    def self.to_json(e : StreamViewType, json : JSON::Builder) : Nil
      value = case e
              when ADDB::StreamViewType::NewImage        then "NEW_IMAGE"
              when ADDB::StreamViewType::OldImage        then "OLD_IMAGE"
              when ADDB::StreamViewType::NewAndOldImages then "NEW_AND_OLD_IMAGES"
              when ADDB::StreamViewType::KeysOnly        then "KEYS_ONLY"
              else
                raise Exception.new("unknown enum value for 'StreamViewType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::StreamViewType
      value = pull.read_string
      case value
      when "NEW_IMAGE"          then ADDB::StreamViewType::NewImage
      when "OLD_IMAGE"          then ADDB::StreamViewType::OldImage
      when "NEW_AND_OLD_IMAGES" then ADDB::StreamViewType::NewAndOldImages
      when "KEYS_ONLY"          then ADDB::StreamViewType::KeysOnly
      else
        raise Exception.new("unknown enum value for 'StreamViewType' when deserializing from json: '#{value}'")
      end
    end
  end
end
