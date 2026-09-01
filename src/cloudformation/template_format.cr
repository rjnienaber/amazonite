private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum TemplateFormat
    Json
    Yaml

    def self.to_json(e : TemplateFormat, json : JSON::Builder) : Nil
      value = case e
              when ACF::TemplateFormat::Json then "JSON"
              when ACF::TemplateFormat::Yaml then "YAML"
              else
                raise Exception.new("unknown enum value for 'TemplateFormat' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::TemplateFormat
      value = pull.read_string
      case value
      when "JSON" then ACF::TemplateFormat::Json
      when "YAML" then ACF::TemplateFormat::Yaml
      else
        raise Exception.new("unknown enum value for 'TemplateFormat' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::TemplateFormat::Json then "JSON"
      when ACF::TemplateFormat::Yaml then "YAML"
      else
        raise Exception.new("unknown enum value for 'TemplateFormat' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::TemplateFormat?
      case key
      when "JSON" then ACF::TemplateFormat::Json
      when "YAML" then ACF::TemplateFormat::Yaml
      else
        nil
      end
    end
  end
end
