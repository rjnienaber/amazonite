private alias ACF = Amazonite::CloudFormation

module Amazonite::CloudFormation
  enum AccountFilterType
    None
    Intersection
    Difference
    Union

    def self.to_json(e : AccountFilterType, json : JSON::Builder) : Nil
      value = case e
              when ACF::AccountFilterType::None         then "NONE"
              when ACF::AccountFilterType::Intersection then "INTERSECTION"
              when ACF::AccountFilterType::Difference   then "DIFFERENCE"
              when ACF::AccountFilterType::Union        then "UNION"
              else
                raise Exception.new("unknown enum value for 'AccountFilterType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::AccountFilterType
      value = pull.read_string
      case value
      when "NONE"         then ACF::AccountFilterType::None
      when "INTERSECTION" then ACF::AccountFilterType::Intersection
      when "DIFFERENCE"   then ACF::AccountFilterType::Difference
      when "UNION"        then ACF::AccountFilterType::Union
      else
        raise Exception.new("unknown enum value for 'AccountFilterType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::AccountFilterType::None         then "NONE"
      when ACF::AccountFilterType::Intersection then "INTERSECTION"
      when ACF::AccountFilterType::Difference   then "DIFFERENCE"
      when ACF::AccountFilterType::Union        then "UNION"
      else
        raise Exception.new("unknown enum value for 'AccountFilterType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::AccountFilterType?
      case key
      when "NONE"         then ACF::AccountFilterType::None
      when "INTERSECTION" then ACF::AccountFilterType::Intersection
      when "DIFFERENCE"   then ACF::AccountFilterType::Difference
      when "UNION"        then ACF::AccountFilterType::Union
      else
        nil
      end
    end
  end
end
