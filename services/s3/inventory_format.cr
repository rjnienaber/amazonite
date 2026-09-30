private alias AS = Amazonite::S3

module Amazonite::S3
  enum InventoryFormat
    Csv
    Orc
    Parquet

    def self.to_json(e : InventoryFormat, json : JSON::Builder) : Nil
      value = case e
              when AS::InventoryFormat::Csv     then "CSV"
              when AS::InventoryFormat::Orc     then "ORC"
              when AS::InventoryFormat::Parquet then "Parquet"
              else
                raise Exception.new("unknown enum value for 'InventoryFormat' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::InventoryFormat
      value = pull.read_string
      case value
      when "CSV"     then AS::InventoryFormat::Csv
      when "ORC"     then AS::InventoryFormat::Orc
      when "Parquet" then AS::InventoryFormat::Parquet
      else
        raise Exception.new("unknown enum value for 'InventoryFormat' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::InventoryFormat::Csv     then "CSV"
      when AS::InventoryFormat::Orc     then "ORC"
      when AS::InventoryFormat::Parquet then "Parquet"
      else
        raise Exception.new("unknown enum value for 'InventoryFormat' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::InventoryFormat?
      case key
      when "CSV"     then AS::InventoryFormat::Csv
      when "ORC"     then AS::InventoryFormat::Orc
      when "Parquet" then AS::InventoryFormat::Parquet
      else
        nil
      end
    end
  end
end
