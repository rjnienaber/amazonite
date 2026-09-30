private alias AS = Amazonite::S3

module Amazonite::S3
  enum QuoteFields
    Always
    Asneeded

    def self.to_json(e : QuoteFields, json : JSON::Builder) : Nil
      value = case e
              when AS::QuoteFields::Always   then "ALWAYS"
              when AS::QuoteFields::Asneeded then "ASNEEDED"
              else
                raise Exception.new("unknown enum value for 'QuoteFields' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::QuoteFields
      value = pull.read_string
      case value
      when "ALWAYS"   then AS::QuoteFields::Always
      when "ASNEEDED" then AS::QuoteFields::Asneeded
      else
        raise Exception.new("unknown enum value for 'QuoteFields' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::QuoteFields::Always   then "ALWAYS"
      when AS::QuoteFields::Asneeded then "ASNEEDED"
      else
        raise Exception.new("unknown enum value for 'QuoteFields' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::QuoteFields?
      case key
      when "ALWAYS"   then AS::QuoteFields::Always
      when "ASNEEDED" then AS::QuoteFields::Asneeded
      else
        nil
      end
    end
  end
end
