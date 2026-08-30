private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum Visibility
    Public
    Private

    def self.to_json(e : Visibility, json : JSON::Builder) : Nil
      value = case e
              when ACF::Visibility::Public  then "PUBLIC"
              when ACF::Visibility::Private then "PRIVATE"
              else
                raise Exception.new("unknown enum value for 'Visibility' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::Visibility
      value = pull.read_string
      case value
      when "PUBLIC"  then ACF::Visibility::Public
      when "PRIVATE" then ACF::Visibility::Private
      else
        raise Exception.new("unknown enum value for 'Visibility' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::Visibility::Public  then "PUBLIC"
      when ACF::Visibility::Private then "PRIVATE"
      else
        raise Exception.new("unknown enum value for 'Visibility' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::Visibility?
      case key
      when "PUBLIC"  then ACF::Visibility::Public
      when "PRIVATE" then ACF::Visibility::Private
      else
        nil
      end
    end
  end
end
