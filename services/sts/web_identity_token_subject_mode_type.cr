private alias AS = Amazonite::Sts

module Amazonite::Sts
  enum WebIdentityTokenSubjectModeType
    AwsIdentity
    OriginIdentity

    def self.to_json(e : WebIdentityTokenSubjectModeType, json : JSON::Builder) : Nil
      value = case e
              when AS::WebIdentityTokenSubjectModeType::AwsIdentity    then "AWSIdentity"
              when AS::WebIdentityTokenSubjectModeType::OriginIdentity then "OriginIdentity"
              else
                raise Exception.new("unknown enum value for 'WebIdentityTokenSubjectModeType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::WebIdentityTokenSubjectModeType
      value = pull.read_string
      case value
      when "AWSIdentity"    then AS::WebIdentityTokenSubjectModeType::AwsIdentity
      when "OriginIdentity" then AS::WebIdentityTokenSubjectModeType::OriginIdentity
      else
        raise Exception.new("unknown enum value for 'WebIdentityTokenSubjectModeType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::WebIdentityTokenSubjectModeType::AwsIdentity    then "AWSIdentity"
      when AS::WebIdentityTokenSubjectModeType::OriginIdentity then "OriginIdentity"
      else
        raise Exception.new("unknown enum value for 'WebIdentityTokenSubjectModeType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::WebIdentityTokenSubjectModeType?
      case key
      when "AWSIdentity"    then AS::WebIdentityTokenSubjectModeType::AwsIdentity
      when "OriginIdentity" then AS::WebIdentityTokenSubjectModeType::OriginIdentity
      else
        nil
      end
    end
  end
end
