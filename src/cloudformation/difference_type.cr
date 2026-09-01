private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum DifferenceType
    Add
    Remove
    NotEqual

    def self.to_json(e : DifferenceType, json : JSON::Builder) : Nil
      value = case e
              when ACF::DifferenceType::Add      then "ADD"
              when ACF::DifferenceType::Remove   then "REMOVE"
              when ACF::DifferenceType::NotEqual then "NOT_EQUAL"
              else
                raise Exception.new("unknown enum value for 'DifferenceType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::DifferenceType
      value = pull.read_string
      case value
      when "ADD"       then ACF::DifferenceType::Add
      when "REMOVE"    then ACF::DifferenceType::Remove
      when "NOT_EQUAL" then ACF::DifferenceType::NotEqual
      else
        raise Exception.new("unknown enum value for 'DifferenceType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::DifferenceType::Add      then "ADD"
      when ACF::DifferenceType::Remove   then "REMOVE"
      when ACF::DifferenceType::NotEqual then "NOT_EQUAL"
      else
        raise Exception.new("unknown enum value for 'DifferenceType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::DifferenceType?
      case key
      when "ADD"       then ACF::DifferenceType::Add
      when "REMOVE"    then ACF::DifferenceType::Remove
      when "NOT_EQUAL" then ACF::DifferenceType::NotEqual
      else
        nil
      end
    end
  end
end
