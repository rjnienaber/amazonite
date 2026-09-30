private alias AS = Amazonite::S3

module Amazonite::S3
  enum TaggingDirective
    Copy
    Replace

    def self.to_json(e : TaggingDirective, json : JSON::Builder) : Nil
      value = case e
              when AS::TaggingDirective::Copy    then "COPY"
              when AS::TaggingDirective::Replace then "REPLACE"
              else
                raise Exception.new("unknown enum value for 'TaggingDirective' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::TaggingDirective
      value = pull.read_string
      case value
      when "COPY"    then AS::TaggingDirective::Copy
      when "REPLACE" then AS::TaggingDirective::Replace
      else
        raise Exception.new("unknown enum value for 'TaggingDirective' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::TaggingDirective::Copy    then "COPY"
      when AS::TaggingDirective::Replace then "REPLACE"
      else
        raise Exception.new("unknown enum value for 'TaggingDirective' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::TaggingDirective?
      case key
      when "COPY"    then AS::TaggingDirective::Copy
      when "REPLACE" then AS::TaggingDirective::Replace
      else
        nil
      end
    end
  end
end
