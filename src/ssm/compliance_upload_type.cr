private alias AS = Amazonite::Ssm

module Amazonite::Ssm
  enum ComplianceUploadType
    Complete
    Partial

    def self.to_json(e : ComplianceUploadType, json : JSON::Builder) : Nil
      value = case e
              when AS::ComplianceUploadType::Complete then "COMPLETE"
              when AS::ComplianceUploadType::Partial  then "PARTIAL"
              else
                raise Exception.new("unknown enum value for 'ComplianceUploadType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ComplianceUploadType
      value = pull.read_string
      case value
      when "COMPLETE" then AS::ComplianceUploadType::Complete
      when "PARTIAL"  then AS::ComplianceUploadType::Partial
      else
        raise Exception.new("unknown enum value for 'ComplianceUploadType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::ComplianceUploadType::Complete then "COMPLETE"
      when AS::ComplianceUploadType::Partial  then "PARTIAL"
      else
        raise Exception.new("unknown enum value for 'ComplianceUploadType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::ComplianceUploadType?
      case key
      when "COMPLETE" then AS::ComplianceUploadType::Complete
      when "PARTIAL"  then AS::ComplianceUploadType::Partial
      else
        nil
      end
    end
  end
end
