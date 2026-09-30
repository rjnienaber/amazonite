private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum AfterValueFrom
    Template

    def self.to_json(e : AfterValueFrom, json : JSON::Builder) : Nil
      value = case e
              when ACF::AfterValueFrom::Template then "TEMPLATE"
              else
                raise Exception.new("unknown enum value for 'AfterValueFrom' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::AfterValueFrom
      value = pull.read_string
      case value
      when "TEMPLATE" then ACF::AfterValueFrom::Template
      else
        raise Exception.new("unknown enum value for 'AfterValueFrom' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::AfterValueFrom::Template then "TEMPLATE"
      else
        raise Exception.new("unknown enum value for 'AfterValueFrom' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::AfterValueFrom?
      case key
      when "TEMPLATE" then ACF::AfterValueFrom::Template
      else
        nil
      end
    end
  end
end
