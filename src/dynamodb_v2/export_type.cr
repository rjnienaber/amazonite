private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  enum ExportType
    FullExport
    IncrementalExport

    def self.to_json(e : ExportType, json : JSON::Builder) : Nil
      value = case e
              when ADDB::ExportType::FullExport        then "FULL_EXPORT"
              when ADDB::ExportType::IncrementalExport then "INCREMENTAL_EXPORT"
              else
                raise Exception.new("unknown enum value for 'ExportType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::ExportType
      value = pull.read_string
      case value
      when "FULL_EXPORT"        then ADDB::ExportType::FullExport
      when "INCREMENTAL_EXPORT" then ADDB::ExportType::IncrementalExport
      else
        raise Exception.new("unknown enum value for 'ExportType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ADDB::ExportType::FullExport        then "FULL_EXPORT"
      when ADDB::ExportType::IncrementalExport then "INCREMENTAL_EXPORT"
      else
        raise Exception.new("unknown enum value for 'ExportType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ADDB::ExportType?
      case key
      when "FULL_EXPORT"        then ADDB::ExportType::FullExport
      when "INCREMENTAL_EXPORT" then ADDB::ExportType::IncrementalExport
      else
        nil
      end
    end
  end
end
