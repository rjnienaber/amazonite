private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum OutputFormat
    Csv
    Parquet

    def self.to_json(e : OutputFormat, json : JSON::Builder) : Nil
      value = case e
              when AEC::OutputFormat::Csv     then "csv"
              when AEC::OutputFormat::Parquet then "parquet"
              else
                raise Exception.new("unknown enum value for 'OutputFormat' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::OutputFormat
      value = pull.read_string
      case value
      when "csv"     then AEC::OutputFormat::Csv
      when "parquet" then AEC::OutputFormat::Parquet
      else
        raise Exception.new("unknown enum value for 'OutputFormat' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::OutputFormat::Csv     then "csv"
      when AEC::OutputFormat::Parquet then "parquet"
      else
        raise Exception.new("unknown enum value for 'OutputFormat' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::OutputFormat?
      case key
      when "csv"     then AEC::OutputFormat::Csv
      when "parquet" then AEC::OutputFormat::Parquet
      else
        nil
      end
    end
  end
end
