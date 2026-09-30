private alias AS = Amazonite::S3

module Amazonite::S3
  enum FilterRuleName
    Prefix
    Suffix

    def self.to_json(e : FilterRuleName, json : JSON::Builder) : Nil
      value = case e
              when AS::FilterRuleName::Prefix then "prefix"
              when AS::FilterRuleName::Suffix then "suffix"
              else
                raise Exception.new("unknown enum value for 'FilterRuleName' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::FilterRuleName
      value = pull.read_string
      case value
      when "prefix" then AS::FilterRuleName::Prefix
      when "suffix" then AS::FilterRuleName::Suffix
      else
        raise Exception.new("unknown enum value for 'FilterRuleName' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::FilterRuleName::Prefix then "prefix"
      when AS::FilterRuleName::Suffix then "suffix"
      else
        raise Exception.new("unknown enum value for 'FilterRuleName' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::FilterRuleName?
      case key
      when "prefix" then AS::FilterRuleName::Prefix
      when "suffix" then AS::FilterRuleName::Suffix
      else
        nil
      end
    end
  end
end
