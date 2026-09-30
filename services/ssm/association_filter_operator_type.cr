private alias AS = Amazonite::Ssm

module Amazonite::Ssm
  enum AssociationFilterOperatorType
    Equal
    LessThan
    GreaterThan

    def self.to_json(e : AssociationFilterOperatorType, json : JSON::Builder) : Nil
      value = case e
              when AS::AssociationFilterOperatorType::Equal       then "EQUAL"
              when AS::AssociationFilterOperatorType::LessThan    then "LESS_THAN"
              when AS::AssociationFilterOperatorType::GreaterThan then "GREATER_THAN"
              else
                raise Exception.new("unknown enum value for 'AssociationFilterOperatorType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::AssociationFilterOperatorType
      value = pull.read_string
      case value
      when "EQUAL"        then AS::AssociationFilterOperatorType::Equal
      when "LESS_THAN"    then AS::AssociationFilterOperatorType::LessThan
      when "GREATER_THAN" then AS::AssociationFilterOperatorType::GreaterThan
      else
        raise Exception.new("unknown enum value for 'AssociationFilterOperatorType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::AssociationFilterOperatorType::Equal       then "EQUAL"
      when AS::AssociationFilterOperatorType::LessThan    then "LESS_THAN"
      when AS::AssociationFilterOperatorType::GreaterThan then "GREATER_THAN"
      else
        raise Exception.new("unknown enum value for 'AssociationFilterOperatorType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::AssociationFilterOperatorType?
      case key
      when "EQUAL"        then AS::AssociationFilterOperatorType::Equal
      when "LESS_THAN"    then AS::AssociationFilterOperatorType::LessThan
      when "GREATER_THAN" then AS::AssociationFilterOperatorType::GreaterThan
      else
        nil
      end
    end
  end
end
