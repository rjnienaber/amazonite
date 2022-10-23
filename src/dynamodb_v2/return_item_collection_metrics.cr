private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  enum ReturnItemCollectionMetrics
    Size
    None

    def self.to_json(e : ReturnItemCollectionMetrics, json : JSON::Builder) : Nil
      value = case e
              when ADDB::ReturnItemCollectionMetrics::Size then "SIZE"
              when ADDB::ReturnItemCollectionMetrics::None then "NONE"
              else
                raise Exception.new("unknown enum value for 'ReturnItemCollectionMetrics' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::ReturnItemCollectionMetrics
      value = pull.read_string
      case value
      when "SIZE" then ADDB::ReturnItemCollectionMetrics::Size
      when "NONE" then ADDB::ReturnItemCollectionMetrics::None
      else
        raise Exception.new("unknown enum value for 'ReturnItemCollectionMetrics' when deserializing from json: '#{value}'")
      end
    end
  end
end
