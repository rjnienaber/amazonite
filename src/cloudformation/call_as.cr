private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum CallAs
    Self
    DelegatedAdmin

    def self.to_json(e : CallAs, json : JSON::Builder) : Nil
      value = case e
              when ACF::CallAs::Self           then "SELF"
              when ACF::CallAs::DelegatedAdmin then "DELEGATED_ADMIN"
              else
                raise Exception.new("unknown enum value for 'CallAs' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::CallAs
      value = pull.read_string
      case value
      when "SELF"            then ACF::CallAs::Self
      when "DELEGATED_ADMIN" then ACF::CallAs::DelegatedAdmin
      else
        raise Exception.new("unknown enum value for 'CallAs' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::CallAs::Self           then "SELF"
      when ACF::CallAs::DelegatedAdmin then "DELEGATED_ADMIN"
      else
        raise Exception.new("unknown enum value for 'CallAs' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::CallAs?
      case key
      when "SELF"            then ACF::CallAs::Self
      when "DELEGATED_ADMIN" then ACF::CallAs::DelegatedAdmin
      else
        nil
      end
    end
  end
end
