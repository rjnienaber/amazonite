private alias AS = Amazonite::S3

module Amazonite::S3
  enum StorageClassAnalysisSchemaVersion
    V1

    def self.to_json(e : StorageClassAnalysisSchemaVersion, json : JSON::Builder) : Nil
      value = case e
              when AS::StorageClassAnalysisSchemaVersion::V1 then "V_1"
              else
                raise Exception.new("unknown enum value for 'StorageClassAnalysisSchemaVersion' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::StorageClassAnalysisSchemaVersion
      value = pull.read_string
      case value
      when "V_1" then AS::StorageClassAnalysisSchemaVersion::V1
      else
        raise Exception.new("unknown enum value for 'StorageClassAnalysisSchemaVersion' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::StorageClassAnalysisSchemaVersion::V1 then "V_1"
      else
        raise Exception.new("unknown enum value for 'StorageClassAnalysisSchemaVersion' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::StorageClassAnalysisSchemaVersion?
      case key
      when "V_1" then AS::StorageClassAnalysisSchemaVersion::V1
      else
        nil
      end
    end
  end
end
