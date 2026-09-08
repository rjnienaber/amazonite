private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum DestinationFileFormat
    PlainText
    Parquet

    def self.to_json(e : DestinationFileFormat, json : JSON::Builder) : Nil
      value = case e
              when AEC::DestinationFileFormat::PlainText then "plain-text"
              when AEC::DestinationFileFormat::Parquet   then "parquet"
              else
                raise Exception.new("unknown enum value for 'DestinationFileFormat' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::DestinationFileFormat
      value = pull.read_string
      case value
      when "plain-text" then AEC::DestinationFileFormat::PlainText
      when "parquet"    then AEC::DestinationFileFormat::Parquet
      else
        raise Exception.new("unknown enum value for 'DestinationFileFormat' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::DestinationFileFormat::PlainText then "plain-text"
      when AEC::DestinationFileFormat::Parquet   then "parquet"
      else
        raise Exception.new("unknown enum value for 'DestinationFileFormat' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::DestinationFileFormat?
      case key
      when "plain-text" then AEC::DestinationFileFormat::PlainText
      when "parquet"    then AEC::DestinationFileFormat::Parquet
      else
        nil
      end
    end
  end
end
