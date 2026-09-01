private alias ADDB = Amazonite::DynamoDB

module Amazonite::DynamoDB
  enum SearchSchemaElementType
    Hash
    InlineFilter

    def self.to_json(e : SearchSchemaElementType, json : JSON::Builder) : Nil
      value = case e
              when ADDB::SearchSchemaElementType::Hash         then "HASH"
              when ADDB::SearchSchemaElementType::InlineFilter then "INLINE_FILTER"
              else
                raise Exception.new("unknown enum value for 'SearchSchemaElementType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::SearchSchemaElementType
      value = pull.read_string
      case value
      when "HASH"          then ADDB::SearchSchemaElementType::Hash
      when "INLINE_FILTER" then ADDB::SearchSchemaElementType::InlineFilter
      else
        raise Exception.new("unknown enum value for 'SearchSchemaElementType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ADDB::SearchSchemaElementType::Hash         then "HASH"
      when ADDB::SearchSchemaElementType::InlineFilter then "INLINE_FILTER"
      else
        raise Exception.new("unknown enum value for 'SearchSchemaElementType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ADDB::SearchSchemaElementType?
      case key
      when "HASH"          then ADDB::SearchSchemaElementType::Hash
      when "INLINE_FILTER" then ADDB::SearchSchemaElementType::InlineFilter
      else
        nil
      end
    end
  end
end
