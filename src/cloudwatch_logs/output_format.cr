private alias ACWL = Amazonite::CloudWatchLogs

module Amazonite::CloudWatchLogs
  enum OutputFormat
    Json
    Plain
    W3c
    Raw
    Parquet

    def self.to_json(e : OutputFormat, json : JSON::Builder) : Nil
      value = case e
              when ACWL::OutputFormat::Json    then "json"
              when ACWL::OutputFormat::Plain   then "plain"
              when ACWL::OutputFormat::W3c     then "w3c"
              when ACWL::OutputFormat::Raw     then "raw"
              when ACWL::OutputFormat::Parquet then "parquet"
              else
                raise Exception.new("unknown enum value for 'OutputFormat' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::OutputFormat
      value = pull.read_string
      case value
      when "json"    then ACWL::OutputFormat::Json
      when "plain"   then ACWL::OutputFormat::Plain
      when "w3c"     then ACWL::OutputFormat::W3c
      when "raw"     then ACWL::OutputFormat::Raw
      when "parquet" then ACWL::OutputFormat::Parquet
      else
        raise Exception.new("unknown enum value for 'OutputFormat' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ACWL::OutputFormat::Json    then "json"
      when ACWL::OutputFormat::Plain   then "plain"
      when ACWL::OutputFormat::W3c     then "w3c"
      when ACWL::OutputFormat::Raw     then "raw"
      when ACWL::OutputFormat::Parquet then "parquet"
      else
        raise Exception.new("unknown enum value for 'OutputFormat' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ACWL::OutputFormat?
      case key
      when "json"    then ACWL::OutputFormat::Json
      when "plain"   then ACWL::OutputFormat::Plain
      when "w3c"     then ACWL::OutputFormat::W3c
      when "raw"     then ACWL::OutputFormat::Raw
      when "parquet" then ACWL::OutputFormat::Parquet
      else
        nil
      end
    end
  end
end
