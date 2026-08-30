private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum Category
    Registered
    Activated
    ThirdParty
    AwsTypes

    def self.to_json(e : Category, json : JSON::Builder) : Nil
      value = case e
              when ACF::Category::Registered then "REGISTERED"
              when ACF::Category::Activated  then "ACTIVATED"
              when ACF::Category::ThirdParty then "THIRD_PARTY"
              when ACF::Category::AwsTypes   then "AWS_TYPES"
              else
                raise Exception.new("unknown enum value for 'Category' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::Category
      value = pull.read_string
      case value
      when "REGISTERED"  then ACF::Category::Registered
      when "ACTIVATED"   then ACF::Category::Activated
      when "THIRD_PARTY" then ACF::Category::ThirdParty
      when "AWS_TYPES"   then ACF::Category::AwsTypes
      else
        raise Exception.new("unknown enum value for 'Category' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACF::Category::Registered then "REGISTERED"
      when ACF::Category::Activated  then "ACTIVATED"
      when ACF::Category::ThirdParty then "THIRD_PARTY"
      when ACF::Category::AwsTypes   then "AWS_TYPES"
      else
        raise Exception.new("unknown enum value for 'Category' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACF::Category?
      case key
      when "REGISTERED"  then ACF::Category::Registered
      when "ACTIVATED"   then ACF::Category::Activated
      when "THIRD_PARTY" then ACF::Category::ThirdParty
      when "AWS_TYPES"   then ACF::Category::AwsTypes
      else
        nil
      end
    end
  end
end
