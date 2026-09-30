private alias AS = Amazonite::S3

module Amazonite::S3
  enum AnnotationDirective
    Copy
    Exclude

    def self.to_json(e : AnnotationDirective, json : JSON::Builder) : Nil
      value = case e
              when AS::AnnotationDirective::Copy    then "COPY"
              when AS::AnnotationDirective::Exclude then "EXCLUDE"
              else
                raise Exception.new("unknown enum value for 'AnnotationDirective' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::AnnotationDirective
      value = pull.read_string
      case value
      when "COPY"    then AS::AnnotationDirective::Copy
      when "EXCLUDE" then AS::AnnotationDirective::Exclude
      else
        raise Exception.new("unknown enum value for 'AnnotationDirective' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::AnnotationDirective::Copy    then "COPY"
      when AS::AnnotationDirective::Exclude then "EXCLUDE"
      else
        raise Exception.new("unknown enum value for 'AnnotationDirective' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::AnnotationDirective?
      case key
      when "COPY"    then AS::AnnotationDirective::Copy
      when "EXCLUDE" then AS::AnnotationDirective::Exclude
      else
        nil
      end
    end
  end
end
