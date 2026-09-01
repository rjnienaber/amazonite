private alias ADDB = Amazonite::DynamoDB

module Amazonite::DynamoDB
  enum TableClass
    Standard
    StandardInfrequentAccess

    def self.to_json(e : TableClass, json : JSON::Builder) : Nil
      value = case e
              when ADDB::TableClass::Standard                 then "STANDARD"
              when ADDB::TableClass::StandardInfrequentAccess then "STANDARD_INFREQUENT_ACCESS"
              else
                raise Exception.new("unknown enum value for 'TableClass' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::TableClass
      value = pull.read_string
      case value
      when "STANDARD"                   then ADDB::TableClass::Standard
      when "STANDARD_INFREQUENT_ACCESS" then ADDB::TableClass::StandardInfrequentAccess
      else
        raise Exception.new("unknown enum value for 'TableClass' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ADDB::TableClass::Standard                 then "STANDARD"
      when ADDB::TableClass::StandardInfrequentAccess then "STANDARD_INFREQUENT_ACCESS"
      else
        raise Exception.new("unknown enum value for 'TableClass' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ADDB::TableClass?
      case key
      when "STANDARD"                   then ADDB::TableClass::Standard
      when "STANDARD_INFREQUENT_ACCESS" then ADDB::TableClass::StandardInfrequentAccess
      else
        nil
      end
    end
  end
end
