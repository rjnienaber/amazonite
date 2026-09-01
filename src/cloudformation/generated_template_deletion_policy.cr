private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum GeneratedTemplateDeletionPolicy
    Delete
    Retain

    def self.to_json(e : GeneratedTemplateDeletionPolicy, json : JSON::Builder) : Nil
      value = case e
              when ACF::GeneratedTemplateDeletionPolicy::Delete then "DELETE"
              when ACF::GeneratedTemplateDeletionPolicy::Retain then "RETAIN"
              else
                raise Exception.new("unknown enum value for 'GeneratedTemplateDeletionPolicy' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::GeneratedTemplateDeletionPolicy
      value = pull.read_string
      case value
      when "DELETE" then ACF::GeneratedTemplateDeletionPolicy::Delete
      when "RETAIN" then ACF::GeneratedTemplateDeletionPolicy::Retain
      else
        raise Exception.new("unknown enum value for 'GeneratedTemplateDeletionPolicy' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::GeneratedTemplateDeletionPolicy::Delete then "DELETE"
      when ACF::GeneratedTemplateDeletionPolicy::Retain then "RETAIN"
      else
        raise Exception.new("unknown enum value for 'GeneratedTemplateDeletionPolicy' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::GeneratedTemplateDeletionPolicy?
      case key
      when "DELETE" then ACF::GeneratedTemplateDeletionPolicy::Delete
      when "RETAIN" then ACF::GeneratedTemplateDeletionPolicy::Retain
      else
        nil
      end
    end
  end
end
