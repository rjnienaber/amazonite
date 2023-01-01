private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum DocumentFormat
    Yaml
    Json
    Text

    def self.to_json(e : DocumentFormat, json : JSON::Builder) : Nil
      value = case e
              when AS::DocumentFormat::Yaml then "YAML"
              when AS::DocumentFormat::Json then "JSON"
              when AS::DocumentFormat::Text then "TEXT"
              else
                raise Exception.new("unknown enum value for 'DocumentFormat' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::DocumentFormat
      value = pull.read_string
      case value
      when "YAML" then AS::DocumentFormat::Yaml
      when "JSON" then AS::DocumentFormat::Json
      when "TEXT" then AS::DocumentFormat::Text
      else
        raise Exception.new("unknown enum value for 'DocumentFormat' when deserializing from json: '#{value}'")
      end
    end
  end
end
