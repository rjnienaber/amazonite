private alias AS = Amazonite::S3

module Amazonite::S3
  enum AnalyticsS3ExportFileFormat
    Csv

    def self.to_json(e : AnalyticsS3ExportFileFormat, json : JSON::Builder) : Nil
      value = case e
              when AS::AnalyticsS3ExportFileFormat::Csv then "CSV"
              else
                raise Exception.new("unknown enum value for 'AnalyticsS3ExportFileFormat' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::AnalyticsS3ExportFileFormat
      value = pull.read_string
      case value
      when "CSV" then AS::AnalyticsS3ExportFileFormat::Csv
      else
        raise Exception.new("unknown enum value for 'AnalyticsS3ExportFileFormat' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::AnalyticsS3ExportFileFormat::Csv then "CSV"
      else
        raise Exception.new("unknown enum value for 'AnalyticsS3ExportFileFormat' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::AnalyticsS3ExportFileFormat?
      case key
      when "CSV" then AS::AnalyticsS3ExportFileFormat::Csv
      else
        nil
      end
    end
  end
end
