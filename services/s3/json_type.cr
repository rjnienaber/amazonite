private alias AS = Amazonite::S3

module Amazonite::S3
  enum JSONType
    Document
    Lines

    def self.to_json(e : JSONType, json : JSON::Builder) : Nil
      value = case e
              when AS::JSONType::Document then "DOCUMENT"
              when AS::JSONType::Lines    then "LINES"
              else
                raise Exception.new("unknown enum value for 'JSONType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::JSONType
      value = pull.read_string
      case value
      when "DOCUMENT" then AS::JSONType::Document
      when "LINES"    then AS::JSONType::Lines
      else
        raise Exception.new("unknown enum value for 'JSONType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::JSONType::Document then "DOCUMENT"
      when AS::JSONType::Lines    then "LINES"
      else
        raise Exception.new("unknown enum value for 'JSONType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::JSONType?
      case key
      when "DOCUMENT" then AS::JSONType::Document
      when "LINES"    then AS::JSONType::Lines
      else
        nil
      end
    end
  end
end
