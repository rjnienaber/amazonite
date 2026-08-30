private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum GeneratedTemplateUpdateReplacePolicy
    Delete
    Retain

    def self.to_json(e : GeneratedTemplateUpdateReplacePolicy, json : JSON::Builder) : Nil
      value = case e
              when ACF::GeneratedTemplateUpdateReplacePolicy::Delete then "DELETE"
              when ACF::GeneratedTemplateUpdateReplacePolicy::Retain then "RETAIN"
              else
                raise Exception.new("unknown enum value for 'GeneratedTemplateUpdateReplacePolicy' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::GeneratedTemplateUpdateReplacePolicy
      value = pull.read_string
      case value
      when "DELETE" then ACF::GeneratedTemplateUpdateReplacePolicy::Delete
      when "RETAIN" then ACF::GeneratedTemplateUpdateReplacePolicy::Retain
      else
        raise Exception.new("unknown enum value for 'GeneratedTemplateUpdateReplacePolicy' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::GeneratedTemplateUpdateReplacePolicy::Delete then "DELETE"
      when ACF::GeneratedTemplateUpdateReplacePolicy::Retain then "RETAIN"
      else
        raise Exception.new("unknown enum value for 'GeneratedTemplateUpdateReplacePolicy' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::GeneratedTemplateUpdateReplacePolicy?
      case key
      when "DELETE" then ACF::GeneratedTemplateUpdateReplacePolicy::Delete
      when "RETAIN" then ACF::GeneratedTemplateUpdateReplacePolicy::Retain
      else
        nil
      end
    end
  end
end
