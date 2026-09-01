private alias AAG = Amazonite::ApiGateway

module Amazonite::ApiGateway
  enum ApiKeysFormat
    Csv

    def self.to_json(e : ApiKeysFormat, json : JSON::Builder) : Nil
      value = case e
              when AAG::ApiKeysFormat::Csv then "csv"
              else
                raise Exception.new("unknown enum value for 'ApiKeysFormat' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AAG::ApiKeysFormat
      value = pull.read_string
      case value
      when "csv" then AAG::ApiKeysFormat::Csv
      else
        raise Exception.new("unknown enum value for 'ApiKeysFormat' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AAG::ApiKeysFormat::Csv then "csv"
      else
        raise Exception.new("unknown enum value for 'ApiKeysFormat' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AAG::ApiKeysFormat?
      case key
      when "csv" then AAG::ApiKeysFormat::Csv
      else
        nil
      end
    end
  end
end
