private alias AS = Amazonite::S3

module Amazonite::S3
  enum MetadataDirective
    Copy
    Replace

    def self.to_json(e : MetadataDirective, json : JSON::Builder) : Nil
      value = case e
              when AS::MetadataDirective::Copy    then "COPY"
              when AS::MetadataDirective::Replace then "REPLACE"
              else
                raise Exception.new("unknown enum value for 'MetadataDirective' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::MetadataDirective
      value = pull.read_string
      case value
      when "COPY"    then AS::MetadataDirective::Copy
      when "REPLACE" then AS::MetadataDirective::Replace
      else
        raise Exception.new("unknown enum value for 'MetadataDirective' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::MetadataDirective::Copy    then "COPY"
      when AS::MetadataDirective::Replace then "REPLACE"
      else
        raise Exception.new("unknown enum value for 'MetadataDirective' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::MetadataDirective?
      case key
      when "COPY"    then AS::MetadataDirective::Copy
      when "REPLACE" then AS::MetadataDirective::Replace
      else
        nil
      end
    end
  end
end
