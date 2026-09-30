private alias ADDB = Amazonite::DynamoDB

module Amazonite::DynamoDB
  enum Select
    AllAttributes
    AllProjectedAttributes
    SpecificAttributes
    Count

    def self.to_json(e : Select, json : JSON::Builder) : Nil
      value = case e
              when ADDB::Select::AllAttributes          then "ALL_ATTRIBUTES"
              when ADDB::Select::AllProjectedAttributes then "ALL_PROJECTED_ATTRIBUTES"
              when ADDB::Select::SpecificAttributes     then "SPECIFIC_ATTRIBUTES"
              when ADDB::Select::Count                  then "COUNT"
              else
                raise Exception.new("unknown enum value for 'Select' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::Select
      value = pull.read_string
      case value
      when "ALL_ATTRIBUTES"           then ADDB::Select::AllAttributes
      when "ALL_PROJECTED_ATTRIBUTES" then ADDB::Select::AllProjectedAttributes
      when "SPECIFIC_ATTRIBUTES"      then ADDB::Select::SpecificAttributes
      when "COUNT"                    then ADDB::Select::Count
      else
        raise Exception.new("unknown enum value for 'Select' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ADDB::Select::AllAttributes          then "ALL_ATTRIBUTES"
      when ADDB::Select::AllProjectedAttributes then "ALL_PROJECTED_ATTRIBUTES"
      when ADDB::Select::SpecificAttributes     then "SPECIFIC_ATTRIBUTES"
      when ADDB::Select::Count                  then "COUNT"
      else
        raise Exception.new("unknown enum value for 'Select' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ADDB::Select?
      case key
      when "ALL_ATTRIBUTES"           then ADDB::Select::AllAttributes
      when "ALL_PROJECTED_ATTRIBUTES" then ADDB::Select::AllProjectedAttributes
      when "SPECIFIC_ATTRIBUTES"      then ADDB::Select::SpecificAttributes
      when "COUNT"                    then ADDB::Select::Count
      else
        nil
      end
    end
  end
end
